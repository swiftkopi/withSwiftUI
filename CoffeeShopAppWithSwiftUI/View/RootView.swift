//
//  RootView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI
import SwiftUIRouter

struct RootView: View {
    
    @StateObject var state: State
    
    var body: some View {
            Router {
                ZStack(alignment: .center){
                        Group{
                            MainView(state: state)
                            
                            ProductRoute(state: state)
                            
                            Route(path: "/category") {
                                CategoryView()
                            }
                            
                            MenuRoute(state: state)
                            
                            CartRoute(state: state)
                            
                            ProfileRoute(state: state)
                            
                            ModalHomeSetupOrderView(isShowing: $state.showModalHome, state: state)
                            
                            ModalDeleteItemFromCartView(isShowing: $state.shohModalDelteItemOnCart)
                            
                            ModalSetDefaultAddress(isShowing: $state.showModalSetDefaultAddress, state: state)
                            
                            ModalChangeProfilePictView(isShowing: $state.showModalEditProfilePict, state: state)
                           
                        }
                    
                    PinScreenAppView(state: state, locked: $state.isLockScreen)
                    
                    
                    
                }
                .preferredColorScheme(self.state.bool ? .dark : .light)
                .ignoresSafeArea(.all)
            }
       
    }
}



struct ProductRoute: View {
    
    @StateObject var state: State
    
    var body: some View{
        
        Group{
            Route(path: "/product/1") {
                ProductDetailView(state: state)
            }
            
            Route(path: "/product/1/add_notes") {
                NotesView(state: state)
            }
        }
       
    }
}


struct MenuRoute: View {
    @StateObject var state: State
    
    var body: some View{
        Group{
            Route(path: "/menu/profile_detail"){
                NewAddressView(state: state)
            }
        }
    }
}


struct CartRoute: View {
    
    @StateObject var state: State
    
    var body: some View {
        Group{
            Route(path: "/cart/order") {
                OrderView(state: state)
            }
        }
    }
}


struct ProfileRoute: View {
    
    @StateObject var state: State
    
    var body: some View {
        
        Group{
            Route(path: "/profile/account_details") {
                AccountDetailView(state: state)
            }
            
            Route(path: "/profile/biodata") {
                ProfileDetailView()
            }
            
            Route(path: "/profile/biodata/edit") {
                EditProfileView()
            }
            
            Route(path: "/profile/security") {
                SecurityView()
            }
            
            Route(path: "/profile/security/pin_screen") {
                PinScreenView()
            }
            
            Route(path: "/profile/security/pin_screen/new_pin") {
                CreateNewPinView(state: state, unlockScreen: $state.isLockScreen)
            }
            
            Route(path: "/profile/shipping") {
                ShippingDetailView(state: state)
                    .if(state.showModalSetDefaultAddress, transform: { view in
                        view
                            .blur(radius: 2)
                    })
            }
            Route(path: "/profile/shipping/new_address") {
                NewAddressView(state: state)
            }
            Route(path: "/profile/shipping/edit_address"){
                EditAddressView(state: state)
            }
            
            Route(path: "/profile/settings") {
                SettingsView(state: state)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(state: State())
    }
}
