import Foundation


enum DriveMode {
    case manual
    case autopilot
}

enum AutoPilotErrors: Error {
    case lostOnRoad
    case lowBattery
    
}

class TeslaCar {
    
    let mass: Double = 2108
    let length: Double = 4976
    let width: Double = 1963
    let height: Double = 1435
    let wheelbase: Double = 2959
    let clearance: Double = 154.9
    let trunkVolume: Double = 900

    var musicOn: Bool = false
    var sunroofOpenPercent: Double = 0
    var fanSpeed: Int = 0
    var driverSeatTemperature: Double = 20

    var driveMode: DriveMode = .manual

    func enableAutoPilot() throws {
        print("Внимание! Включение автопилота может быть опасно. Пожалуйста, следите за движением автомобиля.")
        driveMode = .autopilot

        let lostOnRoad = true
        let lowBattery = false

        if lostOnRoad {
            throw AutoPilotErrors.lostOnRoad
        }

        if lowBattery {
            throw AutoPilotErrors.lowBattery
        }

    }

}

let myTesla = TeslaCar()
do {
    try myTesla.enableAutoPilot()
} catch AutoPilotErrors.lostOnRoad {
    print("Ошибка: потеря на дороге. Решение: включите GPS.")
} catch AutoPilotErrors.lowBattery {
    print("Ошибка: низкий заряд батареи. Решение: двигайтесь на ближайшую станцию подзарядки.")
} catch {
    print("Неизвестная ошибка: \(error).")
}
