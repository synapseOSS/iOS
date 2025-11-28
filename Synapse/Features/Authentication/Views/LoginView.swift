import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showRegister = false
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Synapse").font(.largeTitle.bold()).padding(.top, 60)
                
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.password)
                }
                .padding(.horizontal)
                
                if let error = authViewModel.errorMessage {
                    Text(error).foregroundColor(.red).font(.caption)
                }
                
                Button {
                    Task { await authViewModel.signIn(email: email, password: password) }
                } label: {
                    if authViewModel.isLoading { ProgressView() } else { Text("Sign In") }
                }
                .buttonStyle(.borderedProminent)
                .disabled(email.isEmpty || password.isEmpty || authViewModel.isLoading)
                
                Button("Forgot Password?") { showForgotPassword = true }.font(.footnote)
                Spacer()
                Button("Don't have an account? Sign Up") { showRegister = true }
            }
            .navigationDestination(isPresented: $showRegister) { RegisterView() }
            .sheet(isPresented: $showForgotPassword) { ForgotPasswordView() }
        }
    }
}
