module Danger
  # Show the greeting on a pull request.
  #
  # @example Show the greeting
  #          welcome_message.greet
  #
  # @example When you want to greet with your words
  #          welcome_message.custom_words = <<-CUSTOM_WORDS
  #            Hi, @#{github.pr_author}!!
  #            Welcome to #{github.pr_json[:base][:repo][:full_name]}! Thanks so much for joining us.
  #          CUSTOM_WORDS
  #
  #          welcome_message.greet
  #
  # @example When you want to see the greeting irrespective of the conditions
  #          welcome_message.greet_test
  #
  # @see  soudai-s/danger-welcome_message
  # @tags monday, weekends, time, rattata
  #
  class DangerWelcomeMessage < Plugin


    # Custom words for greeting
    #
    # @return [String]
    attr_writer :custom_words

    # Greet when a new member makes a first pull request
    #
    # @return [void]
    def greet
      message greeting_words if new_member?
    end

    # Greet every time
    #
    # @return [void]
    def greet_test
      message greeting_words
    end

    private

      def repo
        @repository ||= github.pr_json[:base][:repo][:full_name]
      end

      def collaborators
        @collaborators ||= github.api.collaborators(repo).map { |c| c.login }
      end

      def experienced_people
        @experienced_people ||= github.api.pull_requests(repo).map { |pr| pr.user.login }.uniq
      end

      def new_member?
        new_members = collaborators - experienced_people
        new_members.include? github.pr_author
      end

      def greeting_words
        @custom_words || "Welcome, #{github.pr_author} 🎉"
      end
  end
end
