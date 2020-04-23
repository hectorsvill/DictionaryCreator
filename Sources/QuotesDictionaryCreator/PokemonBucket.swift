//
//  File.swift
//  
//
//  Created by Hector S. Villasano on 4/23/20.
//

import Foundation

open class PokemonBucket {
    private let baseURLString = "https://www.serebii.net/swordshield/pokemon/"
    let bucketName: String

    init(bucketName: String) {
        self.bucketName = bucketName
    }

    open func fetchPokemonImages(with folderName: String) {
        for index in 1...890 {
            let indexString = createPokemonIndex(index: index)
            let urlString = "\(baseURLString)\(indexString).png"
            let url = URL(string: urlString)!

            do {
                let data = try Data(contentsOf: url)
                saveDataToDesktopFolder(data, imageName: indexString, folderName: folderName)
            } catch {
                print(error)
            }
        }

    }

    private func saveDataToDesktopFolder(_ data: Data, imageName: String, folderName: String) {
        let fileManager = FileManager()
        var directoryURL = try! fileManager.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        directoryURL.appendPathComponent(bucketName)

        try! fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)

        directoryURL.appendPathComponent(folderName)
        try! fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)

        directoryURL.appendPathComponent("\(imageName).png")
        fileManager.createFile(atPath: directoryURL.path, contents: data, attributes: nil)

    }

    private func createPokemonIndex(index: Int) -> String {
        var indexLength = 0;
        var indexCopy = index;

        while (indexCopy > 0) {
            indexLength += 1;
            indexCopy /= 10;
        }

        var zerosString = ""

        while (indexLength < 3) {
            zerosString += "0"
            indexLength += 1;
        }

        return  "\(zerosString)\(index)"
    }
}


//var imagesBucket = PokemonBucket(bucketName: "Pokemon_Bucket2")
//imagesBucket.fetchPokemonImages(with: "Sword Shield Images")
