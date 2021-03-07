//
//  StarterScreen.swift
//  iOS_Post
//
//  Created by kim jong moon on 07/03/2021.
//

import SwiftUI

struct StarterScreen: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack{
            if self.session.session  != nil {
                Home()
            }else{
                SignIn()
            }
        }.onAppear{
            session.listen()
        }
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
