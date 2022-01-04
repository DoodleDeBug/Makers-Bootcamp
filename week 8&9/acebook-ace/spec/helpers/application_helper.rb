module SignUpHelper
    def sign_up
        visit "/"
        click_link "Haven't got an account? Sign up!"
        fill_in "user[email]", with: "user@email.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button "Create User"
    end
    
    def log_in
        visit "/"
        fill_in "email", with: "user@email.com"
        fill_in "password", with: "password"
        click_button "Login"
    end
end