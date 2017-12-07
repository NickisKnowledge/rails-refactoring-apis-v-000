class RepositoriesController < ApplicationController
  def index
    github = GithubService.new({'access_token' => session[:token]})
    @repos_array = github.get_repos
    session[:username] = github.get_username
  end

  def create
    github = GithubService.new({'access_token' => session[:token]})
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
