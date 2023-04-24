//
//  ContentView.swift
//  tryMeNot
//
//  Created by CEDAM02 on 24/04/23.
//

import SwiftUI
import UserNotifications
import AVFoundation

var itinerario = []
var 


//Hacemos un comentario
//Hacemos un segundo comentario
struct ContentView: View {
    let synthesizer = AVSpeechSynthesizer()

    func text2speech() {
        // If you write A in the text2speech function, synthesizer.speak(utterance) is not worked.
        // let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "¡hora de tomar tu medicina!")
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        utterance.rate = 0.52
        self.synthesizer.speak(utterance)
    }
    
    func notificar() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
            let content = UNMutableNotificationContent()
            content.title = "Feed the cat"
            content.subtitle = "It looks hungry"
            content.sound = UNNotificationSound.default

            // show this notification five seconds from now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            text2speech();

            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            // add our notification request
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    var body: some View {
        VStack {
            Button("Notificacion"){
                notificar()
            }
            Button("Vamos a hablar"){
                text2speech()
            }
            
            Button("Agregar Medicamento") {
                //nuevaMedicina.init()
            }
            Text("Ir a otra vista")
            NavigationLink(destination: OtraVista()) {
                Image(systemName: "person")
                    .font(.title)
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
