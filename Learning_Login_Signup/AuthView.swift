//
//  ContentView.swift
//  Learning_Login_Signup
//
//  Created by magic on 2026-08-10.
//

import SwiftUI

enum AuthType {
    
    case login
    case register
}

struct AuthView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var authType: AuthType = .login
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var isEmailFocused
    @FocusState private var isPassFocused
    
    @State private var showPass: Bool = false
     
    var body: some View {
        TopView()
        SegmentedView(authType: $authType)
        
        VStack(spacing: 20){
            TextField(text: $email){
                Text("Email")
            }
             .focused($isEmailFocused)
             .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
            
            ZStack{
                TextField(text: $password){
                    Text("Password")
                }
                .focused($isPassFocused)
                .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                .overlay(alignment: .trailing, content: {
                    Button{
                        withAnimation{
                            showPass.toggle()
                        }
                    } label: {
                        Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                            .padding()
                            .foregroundStyle(Color(UIColor.lightGray))
                        
                    }
                })
                .opacity(showPass ? 0 : 1)
                .zIndex(1)
            
                SecureField(text: $password){
                    Text("Password")
                }
                .focused($isPassFocused)
                .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                .overlay(alignment: .trailing, content: {
                    Button{
                        withAnimation{
                            showPass.toggle()
                        }
                    } label: {
                        Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                            .padding()
                            .foregroundStyle(Color(UIColor.lightGray))
                        
                    }
                })
                .opacity(showPass ? 1 : 0)
                
            }
            
                
            
        }
    }
}
struct AuthTextFieldStyle: TextFieldStyle {
   
    @Environment(\.colorScheme) private var colorScheme
    
    let isFocused: FocusState<Bool>.Binding
    
    func _body(configuration:TextField<Self._Label>) -> some View {
    configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                     .stroke(isFocused.wrappedValue ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                                     .zIndex(1)
                }
            )
        
         
    }
}

struct TopView: View {
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
            
            Text("AuthFlow")
                .font(.system(size: 35, weight: .bold, design: .rounded))
        }
        
    }
}

struct SegmentedView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType
    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation{
                    authType = .login
                }
            } label: {
                Text("Login")
                    .fontWeight(authType == .login ? .semibold : .regular)
                    .foregroundStyle(authType == .login ? (colorScheme == .light ? Color(uiColor: UIColor.darkGray) : .white) : .gray)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .login ? 45 : 20)
                    .background(
                        ZStack{
                            if authType == .login {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3),
                                            lineWidth: 0.5)
                                    .zIndex(0.5)
                            }
                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .login ?
                                      Color(UIColor.systemGray5) :
                                      Color(UIColor.systemGray6))
                                .zIndex(0)
                        }
                                            
                    )
        }
            Button {
                withAnimation{
                    authType = .register
                }
            } label: {
                Text("Register")
                    .fontWeight(authType == .register ? .semibold : .regular)
                    .foregroundStyle(authType == .register ? (colorScheme == .light ? Color(uiColor: UIColor.darkGray) : .white) : .gray)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .register ? 35 : 20)
                    .background(
                        ZStack{
                            if authType == .register {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3),
                                            lineWidth: 0.5)
                                    .zIndex(0.5)
                            }
                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .register ?
                                      Color(UIColor.systemGray5) :
                                      Color(UIColor.systemGray6))
                                .zIndex(0)
                        }
                    )
        }

}
        .background(
            Color(UIColor.systemGray6)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
 
        
    }
}

#Preview {
    AuthView()
}
