//
//  SignUp.swift
//  iOS_Post
//
//  Created by kim jong moon on 06/03/2021.
//

import SwiftUI

struct SignUp: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var fulltname = ""
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    
    func doSign_Up() {
        isLoading = true
        SessionStore().signUp(email: email, password: password, handler: {(res, err) in
            isLoading = false
            if err != nil {
                print("User not created")
                return
            }
            print("User created")
            presentation.wrappedValue.dismiss()
        })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    Text("Create An Account")
                        .bold()
                        .padding(.bottom, 25)
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                    
                    
                    
                    TextField("Fullname", text: $fulltname)
                        .frame(height: 45)
                        .padding(.leading, 15)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.trailing)
                        .padding(.leading)
                    TextField("Email", text: $email)
                        .frame(height: 45)
                        .padding(.leading, 15)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.trailing)
                        .padding(.leading)
                    SecureField("Password", text: $password)
                        .frame(height: 45)
                        .padding(.leading, 15)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.trailing)
                        .padding(.leading)
                        
                    Button(action: {
                        doSign_Up()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .font(Font.custom("Pacifico-Regular", size: 20))
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .frame(height: 45)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .padding(.trailing)
                        .padding(.leading)
                        
                    })
                    
                    Spacer()
                    
                    HStack {
                        Text("Already have an account ?").foregroundColor(.white)
                        Button(action: {
                            presentation.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Sign In")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 19))
                        })
                                            
                    }
                    
                    
                }
                if isLoading {
                    ProgressView()
                }
                
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
