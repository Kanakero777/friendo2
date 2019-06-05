class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    #新しいTweetの保存に成功した場合
    if @profile.save
      #index.html.erbにページが移る
      redirect_to controller: 'users', action: 'show', id: current_user.id
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to controller: 'users', action: 'show', id: current_user.id
    end
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to controller: 'users', action: 'show', id: current_user.id

  end

  private
  #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def profile_params
   params.require(:profile).permit(:username,:image,:name,:birthday,:sex,:homeCountry,:nativeLanguage,:newLanguage,:languageLevel,:job,:residence,:introduction,:hobby,:age)
  end
end
