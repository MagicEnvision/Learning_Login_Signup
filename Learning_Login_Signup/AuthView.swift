//
//  ContentView.swift
//  Learning_Login_Signup
//
//  Created by magic on 2026-08-10.
//

import SwiftUI

enum AuthType {
    
    case login
    case signup
}

struct AuthView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var authType: AuthType = .login
    
    var body: some View {
        TopView()
        SegmentedView(authType: $authType)
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
    @Binding var authType: AuthType
    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation{
                    authType = .login
                }
            } label: {
                Text("Login")
            }

        }
        
    }
}

#Preview {
    AuthView()
}
