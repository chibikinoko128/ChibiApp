Rails.application.routes.draw do
  config = Rails.application.config.chibi
  #get 'door#home'
  #root to: 'door#home'
  
  #root 'doors#home'
  
  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ] do
        patch :confirm
      end
      
      resource :password, only: [ :show, :edit, :update ]
      resources :customers
      resource :special, only: [ :show ]
      resource :year, only: [ :show, :edit, :update ]
      resource :staff_year, only: [ :show, :edit, :update ]
      resource :staff_month, only: [ :show, :edit, :update]
      resource :staff_quarter, only: [ :show, :edit, :update]
      resources :registers
     
      resource :bank
      resources :programs do
        patch :entries, on: :member
      end
      
      resources :messages, only: [ :index, :show, :destroy ] do
        get :inbound, :outbound, :deleted, :count, on: :collection
        post :tag, on: :member
        delete :tag, on: :member
        resource :reply, only: [ :new, :create ] do
          post :confirm
        end
      end
      
      resources :tags, only: [] do
        resources :messages, only: [ :index ] do
          get :inbound, :outbound, :deleted, on: :collection
        end
      end
      
      resource :eighteen, only: [ :show ]
      resource :nineteen, only: [ :show ]
      resource :twentie, only: [ :show ]
      resource :one, only: [ :show ]
      resource :twenty_two, only: [ :show ]
      resource :twenty_three, only: [ :show ]
      resource :twenty_four, only: [ :show ]
      resource :twenty_five, only: [ :show ]
      resource :twenty_six, only: [ :show ]
      resource :twenty_seven, only: [ :show ]
      
      resource :record do
        get :customer_pegasus
        get :customer_phoenix
        get :customer_queen
        get :customer_king
        get :customer_president
        get :prefecture_member
        get :not_payment
        get :cash_back
        get :quarter_bonus
      end
    end
  end
 
  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [ :create, :destroy]
      resources :staff_members do
        resources :staff_events, only: [ :index ]
      end
      resources :administrators do
        resources :admin_events, only: [ :index ]
      end
      resources :admin_events, only: [ :index ]
      resources :staff_events, only: [ :index ]
      resources :allowed_sources, only: [ :index, :create ] do
        delete :delete, on: :collection
      end
      
      resources :commissions
      resources :customers
      resources :registers
       
      resources :banks do
        get :account_change
        get :not_account
      end
      resource :password, only: [ :show, :edit, :update ]
      
      resources :sub_eighteens
      resources :sub_nineteens
      resources :sub_twenties
      resources :sub_ones
      resources :sub_twenty_twos
      resources :sub_twenty_threes
      resources :sub_twenty_fours
      resources :sub_twenty_fives
      resources :sub_twenty_sixes
      resources :sub_twenty_sevens
      
      resources :cache_eighteens
      resources :cache_nineteens
      resources :cache_twenties
      resources :cache_ones
      resources :cache_twenty_twos
      resources :cache_twenty_threes
      resources :cache_twenty_fours
      resources :cache_twenty_fives
      resources :cache_twenty_sixes
      resources :cache_twenty_sevens
      
      resources :bonus_eighteens
      resources :bonus_nineteens
      resources :bonus_twenties
      resources :bonus_ones
      resources :bonus_twenty_twos
      resources :bonus_twenty_threes
      resources :bonus_twenty_fours
      resources :bonus_twenty_fives
      resources :bonus_twenty_sixes
      resources :bonus_twenty_sevens
      
      resources :special_eighteens
      resources :special_nineteens
      resources :special_twenties
      resources :special_ones
      resources :special_twenty_twos
      resources :special_twenty_threes
      resources :special_twenty_fours
      resources :special_twenty_fives
      resources :special_twenty_sixes
      resources :special_twenty_sevens
      
      resource :record do
        get :individual
        get :month_cache
        get :month_member
        get :quarter_bonus
        get :year_record
        get :cache_acquisition
        get :bonus_acquisition
        get :acquisition_member
        get :event
        get :information
        get :day_admission
        get :account_change
        get :sp_member
        get :not_payment
        get :month_margin
        get :payment_list
        get :sp_bonus
        get :bonus_confirm
      end
      
      resource :retrieval, only: [ :edit, :update ]
      resource :pay, only: [ :show, :edit, :update ]
      resource :year, only: [ :show, :edit, :update ]
      resource :margin, only: [ :show, :edit, :update ] do
        get :month_margin
      end
      resource :admission, only: [ :edit, :update ]
    end
  end
  
  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do 
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [ :new, :create, :destroy ] do
        get :out
      end
      resource :account, except: [ :new, :create, :destroy ] do 
        patch :confirm
      end
      
      resource :register, only: [ :show, :update ] do
        get :check
      end
      resource :seventeen, only: [ :show ]
      resource :customer_year, only: [ :show, :edit, :update ]
      resource :eighteen, only: [ :show ]
      resource :nineteen, only: [ :show ]
      resource :twentie, only: [ :show ]
      resource :one, only: [ :show ]
      resource :twenty_two, only: [ :show ]
      resource :twenty_three, only: [ :show ]
      resource :twenty_four, only: [ :show ]
      resource :twenty_five, only: [ :show ]
      resource :twenty_six, only: [ :show ]
      resource :twenty_seven, only: [ :show ]
      resource :score, only: [ :show ]
      resource :sponsor, only: [ :show ]
      resource :special, only: [ :show ]
      resource :member, only: [ :show ]
      resource :point, only: [ :show ]
      resource :bank, except: [ :destroy ] do
        patch :confirm
      end
      
      resources :programs, only: [ :index, :show ] do
        resources :entries, only: [ :create ] do
          patch :cancel, on: :member
        end
      end
      
      resources :messages, except: [ :edit, :update ] do
        post :confirm, on: :collection
        resource :reply, only: [ :new, :create ] do
          post :confirm
        end
      end
      
      resource :number, only: [ :edit, :update ]
      
      resource :hint do
        get :daily
      end
      
      resource :video do
        get :video_play
        get :privilege_video
        get :party_video
        get :phoenix_video
        get :queen_video
        get :king_video
        get :president_video
        get :video_menu
        get :video_week
        get :video_month
        get :back_number
        get :retrieval_month
        get :retrieval_week
        get :retrieval_day  
      end
      
      resource :custom do
        get :hint
        get :plan
        get :fund
        get :open
        get :facility
        get :subsidy
        get :adopu
        get :tax
        get :trader
        get :profit
        get :caution
        get :concept
        get :perm
        get :article
        get :interior
        get :conflict
        get :human
        get :stocking
        get :report
        get :reception
        get :working_capital
      end
      
      resource :tavern do
        get :hint
        get :plan
        get :fund
        get :open
        get :facility
        get :subsidy
        get :adopu
        get :tax
        get :trader
        get :profit
        get :caution
        get :concept
        get :business_plan
        get :founded_plan
        get :conflict
        get :article
        get :interior
        get :stocking
        get :human
        get :report
        get :reception
        get :working_capital
      end
      
      resource :record do
        get :individual
        get :bonus_record
        get :bonus_title
        get :sponsor_point
        get :bonus_point
        get :quarter_point
        get :bonus_money
        get :privilege_info
        get :bk_account
      end
      
      resource :rule do
        get :agreement
        get :how_to_use
        get :maintenance
        get :unsubscribe
        get :privilege
        get :lapse
        get :cache
        get :cache_a
        get :bonus
        get :bonus_a
        get :privilege_bonus
        get :privilege_bonus_a
        get :question
        get :personal
        get :account
        get :mouse
        get :trade
        get :bonus_description
        get :cache_description
        get :privilege_description
        get :bonus_a_description
        get :cache_a_description
        get :privilege_a_description
        get :explain
      end
      
      resource :prisoner do
        get :arrest
        get :lawyer
        get :scene
        get :investigation
        get :prosecutor
        get :indictment
        get :jail
        get :hand_over
        get :judgment
        get :sentence
        get :complaint
        get :prison
        get :examination
        get :prison_term
        get :education
        get :factory
        get :release
        get :officer
        get :maturity
        get :top
        get :schedule
        get :caution
      end
      
      resource :success do
        get :top
        get :plan
        get :continuation
        get :celebu
        get :affluence
        get :preparedness
        get :adjust
        get :top_notch
        get :time
        get :challenge
        get :try
        get :study
        get :is_there
        get :non
      end
    end
  end
  
  constraints host: config[:visitor][:host] do
    namespace :visitor, path: config[:visitor][:path] do 
      root 'top#index'
      #resource :customer
      #resource :top do
       # get :welcome
      #end
      
      resource :rule do
        get :agreement
        get :consent
        get :how_to_use
        get :maintenance
        get :unsubscribe
        get :privilege
        get :lapse
        get :cache
        get :bonus
        get :privilege_bonus
        get :question
        get :personal
        get :account
        get :mouse
        get :dashboard
        get :welcome
        get :trade
        get :invitation
        get :toll
        get :invi
        get :bonus_description
        get :cache_description
        get :privilege_description
        get :overview
        get :explain
      end
      resource :customer do
        get :move_now
        get :move_on
        get :not_payment
      end
    end
  end
  
  root 'errors#routing_error'
    get '*anything' => 'errors#routing_error'
  
  root 'extra#sendmail'
end
