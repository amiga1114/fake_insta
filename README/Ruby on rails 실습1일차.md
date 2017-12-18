### 2. Ruby on Rails

> #### Rails
>
> 1. What is Rails?
>
> **1]우리의 목표 ! 우리는 Web Service를 만든다 !**
>
> **2] 프레임 워크?**
>
> - 기본적인 구조나 필요한 코드들은 **알아서 제공**해줄게, 넌 그냥 **좋은 웹 서비스**를 만드는거에 집중해 !
>
> **3] MVC ?**
>
> [![ruby on rails mvc에 대한 이미지 검색결과](https://camo.githubusercontent.com/f526415db3b432e42fc0feaa270730e292c1eb54/687474703a2f2f626c6f672e6966757475727a2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30332f7261696c736d76632e706e67)](https://camo.githubusercontent.com/f526415db3b432e42fc0feaa270730e292c1eb54/687474703a2f2f626c6f672e6966757475727a2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30332f7261696c736d76632e706e67)
>
> 1. Rails 설치방법
>
> ```
> gem install rails -v 4.2.9
>
> ```
>
> 1. Rails 실행방법
>
> ```
> rails new 폴더이름
>
> 이후 Atom으로 폴더를 연다 !
> 그리고 app 폴더가 app.rb로 생각하면 편하다 ! 또한 안에 보면 views 폴더, layout 폴더가 있다.
> app폴더에는 MVC 폴더들이 있따.
>
> 번들이란것을 스킵하여 만들겠다 !
> rails new 폴더이름 --skip-bundle
>
> ```
>
> 1. 컨트롤러 및 모델 생성 방법
>
> ```
> 1. rails generate controller [컨트롤러이름]
>
> 2. app -> controllers -> concerns -> home_controller.rb 에서 
>  def index
>  end
>  추가해주기 !
> 3. app -> views -> home에 index.erb 만들고 작성 !
> 4. routes. rb get '/' => 'home#index' 작성
> ######
> rails g controller [컨트롤러이름 (복수형)] 
> 컨트롤러의 이름은 복수형으로 s 을 붙여서 만드는것이 rails의 네이밍룰 !
>
> rails g model [모델이름 (단수)]
> rake db:migrate 
> rails console => pry 와 같은 놈
>
> ```
>
> 1. 서버 돌리기
>
> ```
> rails server -b 0.0.0.0
>
> -----------------------------
> 매번 -b 0.0.0.0 하기 귀찮으니까 !
> 1. cd ~ 홈 디렉터리로 이동 -> vi .bashrc -> 맨 밑에서 알파뱃 'o' 입력
> 2. alias rs="rails s -b 0.0.0.0" 입력 후 esc
> 3. :w 입력하여 저장 // :q 종료하기
> 4. source ~/.bashrc로 프로그램 실행
> 5. 이후 rs 로 서버 실행시키면 됨 !
>
> ```
>
> 1. gem 추가하기
>
> ```
> Gemfile에서 
> group :development, :test do 이거는 개발환경과 테스트 환경에서 추가
> group :development do 이거는 개발환경에서만 추가
>
> 우리는 일단 group :development do
>   gem 'rails_db'
> end
>
> 그리고 커맨드창에서 bundle install 
>
> ```
>
> 1. db 관리하기
>
> ```
> 테스트 환경에서 DB 관리하기
> http://localhost:3000/rails/db
> 여기서 추가, 삭제도 가능하다 !
>
> ```
>
> #### 2. rails 연습하기
>
> ```
> # 1. lotto
> # => 랜덤 로또 번호를 출력해주는 액션을 만드세요
> # => get '/lotto' => 'home#lotto'
>
> # 2. lunch
> # => 랜덤 네뉴를 출력해주는 액션ㅇ르 만드세요
> # => get '/lunch' => 'home#lunch'
>
> # 3. /search
> # => fake naver search를 해주는 액션을 만드세요
> # => get '/search' => 'home#search'
> # => search.erb -> 검색어를 받아 네이버 검색 결과를 보여주는 form을 만들어 준다.
> ```
>
> - routes.rb
>
> ```
>  get '/' => 'home#index'
>  get '/hello/:name' => 'home#hello'
>  get '/lotto' => 'home#lotto'
>  get '/lunch' => 'home#lunch'
>  get '/search' => 'home#search'
> ```
>
> - home_controller.rb
>
> ```
> class HomeController < ApplicationController
>    def index
>    end
>
>    def hello
>      @name = params[:name]
>    end
>
>    def lotto
>      numbers = (1..45).to_a
>
>      @lotto = numbers.sample(6)
>    end
>
>    def lunch
>      menu = ["칼국수", "뚝불", "김치찌개", "순대국"]
>
>      @lunch = menu.sample
>    end
>
>    def search
>
>    end
>
> end
> ```
>
> - users 만들기
>
> ```
> # 1. User
> # => rails g controller users
> # => rails g model user
> # => routes
> # => get '/signup' => 'users#signup' 회원가입 <form>으로 정보 받아서 /register로 넘겨준다 (email, password)
> # => get '/register' => 'users#register' # 날아온 정보를 User DB에 저장한다
> # => get '/user_list' => 'users#list' 모든 유저의 정보를 보여준다.
> ```