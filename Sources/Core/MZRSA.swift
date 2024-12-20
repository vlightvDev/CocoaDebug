//
//  MZRSA.swift
//  TDSwiftTemplate
//
//  Created by 曾龙 on 2021/12/1.
//

import Foundation

public struct MZRSA {
    /// 使用私钥字符串加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - privateKey: 私钥字符串
    /// - Returns: 加密后Data
    public static func encryptData(_ data: Data, privateKey: String) -> Data? {
        let secKey = addPrivateKey(privateKey)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: true)
    }

    /// 使用私钥字符串加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - privateKey: 私钥字符串
    /// - Returns: 加密后String
    public static func encryptString(_ string: String, privateKey: String) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, privateKey: privateKey) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 使用私钥字符串解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - privateKey: 私钥字符串
    /// - Returns: 解密后Data
    public static func decryptData(_ data: Data, privateKey: String) -> Data? {
        let secKey = addPrivateKey(privateKey)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 使用私钥字符串解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - privateKey: 私钥字符串
    /// - Returns: 解密后String
    public static func decryptString(_ string: String, privateKey: String) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, privateKey: privateKey)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    /// 使用公钥字符串加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - publicKey: 公钥字符串
    /// - Returns: 加密后Data
    public static func encryptData(_ data: Data, publicKey: String) -> Data? {
        let secKey = addPublicKey(publicKey)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: false)
    }

    /// 使用公钥字符串加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - publicKey: 公钥字符串
    /// - Returns: 加密后String
    public static func encryptString(_ string: String, publicKey: String) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, publicKey: publicKey) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 使用公钥字符串解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - publicKey: 公钥字符串
    /// - Returns: 解密后Data
    public static func decryptData(_ data: Data, publicKey: String) -> Data? {
        let secKey = addPublicKey(publicKey)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 使用公钥字符串解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - publicKey: 公钥字符串
    /// - Returns: 解密后String
    public static func decryptString(_ string: String, publicKey: String) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, publicKey: publicKey)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    // MARK: - encrypt or decrypt by SecKey data

    /// 使用私钥Data加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - privateKeyData: 私钥Data
    /// - Returns: 加密后的Data
    public static func encryptData(_ data: Data, privateKeyData: Data) -> Data? {
        let secKey = addPrivateKey(privateKeyData)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: true)
    }

    /// 使用私钥Data加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - privateKeyData: 私钥Data
    /// - Returns: 加密后的String
    public static func encryptString(_ string: String, privateKeyData: Data) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, privateKeyData: privateKeyData) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 用私钥Data解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - privateKeyData: 私钥Data
    /// - Returns: 解密后的Data
    public static func decryptData(_ data: Data, privateKeyData: Data) -> Data? {
        let secKey = addPrivateKey(privateKeyData)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 用私钥Data解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - privateKeyData: 私钥Data
    /// - Returns: 解密后的String
    public static func decryptString(_ string: String, privateKeyData: Data) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, privateKeyData: privateKeyData)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    /// 使用公钥Data加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - publicKeyData: 公钥Data
    /// - Returns: 加密后Data
    public static func encryptData(_ data: Data, publicKeyData: Data) -> Data? {
        let secKey = addPublicKey(publicKeyData)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: false)
    }

    /// 使用公钥Data加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - publicKeyData: 公钥Data
    /// - Returns: 加密后String
    public static func encryptString(_ string: String, publicKeyData: Data) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, publicKeyData: publicKeyData) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 使用公钥Data解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - publicKeyData: 公钥Data
    /// - Returns: 解密后Data
    public static func decryptData(_ data: Data, publicKeyData: Data) -> Data? {
        let secKey = addPublicKey(publicKeyData)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 使用公钥Data解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - publicKeyData: 公钥Data
    /// - Returns: 解密后String
    public static func decryptString(_ string: String, publicKeyData: Data) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, publicKeyData: publicKeyData)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    // MARK: - encrypt or decrypt by SecKey path

    /// 使用私钥证书路径加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - privateKeyPath: 私钥证书路径
    /// - Returns: 加密后Data
    public static func encryptData(_ data: Data, privateKeyPath: String) -> Data? {
        let secKey = loadPrivateKey(privateKeyPath)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: true)
    }

    /// 使用私钥证书路径加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - privateKeyPath: 私钥证书路径
    /// - Returns: 加密后String
    public static func encryptString(_ string: String, privateKeyPath: String) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, privateKeyPath: privateKeyPath) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 使用私钥证书路径解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - privateKeyPath: 私钥证书路径
    /// - Returns: 解密后Data
    public static func decryptData(_ data: Data, privateKeyPath: String) -> Data? {
        let secKey = loadPrivateKey(privateKeyPath)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 使用私钥证书路径解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - privateKeyPath: 私钥证书路径
    /// - Returns: 解密后String
    public static func decryptString(_ string: String, privateKeyPath: String) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, privateKeyPath: privateKeyPath)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    /// 使用公钥证书路径加密Data
    /// - Parameters:
    ///   - data: 需加密的Data
    ///   - publicKeyPath: 公钥证书路径
    /// - Returns: 加密后Data
    public static func encryptData(_ data: Data, publicKeyPath: String) -> Data? {
        let secKey = loadPublicKey(publicKeyPath)
        if secKey == nil {
            return nil
        }
        return encrypt(data, with: secKey!, and: false)
    }

    /// 使用公钥证书路径加密String
    /// - Parameters:
    ///   - string: 需加密的String
    ///   - publicKeyPath: 公钥证书路径
    /// - Returns: 加密后String
    public static func encryptString(_ string: String, publicKeyPath: String) -> String? {
        guard let data = encryptData(string.data(using: String.Encoding.utf8)!, publicKeyPath: publicKeyPath) else {
            return nil
        }
        return base64_encode_data(data)
    }

    /// 使用公钥证书路径解密Data
    /// - Parameters:
    ///   - data: 需解密的Data
    ///   - publicKeyPath: 公钥证书路径
    /// - Returns: 解密后Data
    public static func decryptData(_ data: Data, publicKeyPath: String) -> Data? {
        let secKey = loadPublicKey(publicKeyPath)
        if secKey == nil {
            return nil
        }
        return decrypt(data, with: secKey!)
    }

    /// 使用公钥证书路径解密String
    /// - Parameters:
    ///   - string: 需解密的String
    ///   - publicKeyPath: 公钥证书路径
    /// - Returns: 解密后String
    public static func decryptString(_ string: String, publicKeyPath: String) -> String? {
        var data = base64_decode(string)
        data = decryptData(data!, publicKeyPath: publicKeyPath)
        if data == nil {
            return nil
        }
        return String(data: data!, encoding: String.Encoding.utf8)
    }

    // MARK: - OTHER

    private static func base64_encode_data(_ data: Data) -> String? {
        let newData = data.base64EncodedData(options: Data.Base64EncodingOptions.lineLength64Characters)
        return String(data: newData, encoding: String.Encoding.utf8)
    }

    private static func base64_decode(_ string: String) -> Data? {
        return Data(base64Encoded: string, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
    }

    private static func stripPublicKeyHeader(_ key: Data?) -> Data? {
        guard let dKey = key else {
            return nil
        }
        let len = dKey.count
        if len == 0 {
            return nil
        }

        var cKey = dataToBytes(dKey)
        var index = 0

        if cKey[index] != 0x30 {
            return nil
        }
        index += 1

        if cKey[index] > 0x80 {
            index += Int(cKey[index]) - 0x80 + 1
        } else {
            index += 1
        }

        let swqiod: [CUnsignedChar] = [0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01,
                                       0x01, 0x05, 0x00]
        if memcmp(&cKey[index], swqiod, 15) == 1 {
            return nil
        }

        index += 15

        if cKey[index] != 0x03 {
            return nil
        }
        index += 1

        if cKey[index] > 0x80 {
            index += Int(cKey[index]) - 0x80 + 1
        } else {
            index += 1
        }

        if cKey[index] != Unicode.Scalar("\0").value {
            return nil
        }

        index += 1

        return Data(cKey).advanced(by: index)
    }

    private static func stripPrivateKeyHeader(_ key: Data?) -> Data? {
        guard let dKey = key else {
            return nil
        }
        let len = dKey.count
        if len == 0 {
            return nil
        }
        var cKey = dataToBytes(dKey)
        var index = 22
        if cKey[index] != 0x04 {
            return nil
        }
        index += 1
        var cLen = Int(cKey[index])
        index += 1
        let det = cLen & 0x80
        if det == 0 {
            cLen = cLen & 0x7F
        } else {
            var byteCount = Int(cLen & 0x7F)
            if Int(byteCount) + index > len {
                return nil
            }
            var accum = 0
            var ptr = withUnsafePointer(to: &cKey[index]) { $0 }
            index += Int(byteCount)
            while byteCount > 0 {
                accum = (accum << 8) + Int(ptr.pointee)
                ptr = ptr.advanced(by: 1)
                byteCount -= 1
            }
            cLen = accum
        }

        return dKey.subdata(in: Range(_NSRange(location: index, length: Int(cLen)))!)
    }

    /// 公钥字符串转SecKey
    /// - Parameter key: 公钥字符串
    /// - Returns: SecKey
    private static func addPublicKey(_ key: String) -> SecKey? {
        var newKey = key
        let spos = newKey.range(of: "-----BEGIN PUBLIC KEY-----")
        let epos = newKey.range(of: "-----END PUBLIC KEY-----")
        if spos != nil && epos != nil {
            newKey = String(newKey[spos!.upperBound ..< epos!.lowerBound])
        }
        newKey = newKey.replacingOccurrences(of: "\r", with: "")
        newKey = newKey.replacingOccurrences(of: "\n", with: "")
        newKey = newKey.replacingOccurrences(of: "\t", with: "")
        newKey = newKey.replacingOccurrences(of: " ", with: "")

        var data = base64_decode(newKey)
        data = stripPublicKeyHeader(data)
        if data == nil {
            return nil
        }

        return addPublicKey(data!)
    }

    public static func addPublicKey(_ data: Data) -> SecKey? {
        let tag = "RSAUtil_PubKey"
        let dTag = tag.data(using: String.Encoding.utf8)

        var publicKey = Dictionary<String, Any>.init()
        publicKey[kSecClass as String] = kSecClassKey
        publicKey[kSecAttrKeyType as String] = kSecAttrKeyTypeRSA
        publicKey[kSecAttrApplicationTag as String] = dTag
        SecItemDelete(publicKey as CFDictionary)

        publicKey[kSecValueData as String] = data
        publicKey[kSecAttrKeyClass as String] = kSecAttrKeyClassPublic
        publicKey[kSecReturnPersistentRef as String] = true

        var status = SecItemAdd(publicKey as CFDictionary, nil)

        guard status == errSecSuccess || status == errSecDuplicateItem else {
            return nil
        }

        publicKey.removeValue(forKey: kSecValueData as String)
        publicKey.removeValue(forKey: kSecReturnPersistentRef as String)
        publicKey[kSecReturnRef as String] = NSNumber(value: true)

        var keyRef: CFTypeRef?
        status = SecItemCopyMatching(publicKey as CFDictionary, &keyRef)
        guard status == errSecSuccess else {
            return nil
        }
        return (keyRef as! SecKey)
    }

    /// 私钥字符串转SecKey
    /// - Parameter key: 私钥字符串        /// - Returns: SecKey
    private static func addPrivateKey(_ key: String) -> SecKey? {
        var newKey = key
        var spos: Range<String.Index>?
        var epos: Range<String.Index>?
        spos = newKey.range(of: "-----BEGIN RSA PRIVATE KEY-----")
        if spos != nil {
            epos = newKey.range(of: "-----END RSA PRIVATE KEY-----")
        } else {
            spos = newKey.range(of: "-----BEGIN PRIVATE KEY-----")
            epos = newKey.range(of: "-----END PRIVATE KEY-----")
        }
        if spos != nil && epos != nil {
            newKey = String(newKey[spos!.upperBound ..< epos!.lowerBound])
        }
        newKey = newKey.replacingOccurrences(of: "\r", with: "")
        newKey = newKey.replacingOccurrences(of: "\n", with: "")
        newKey = newKey.replacingOccurrences(of: "\t", with: "")
        newKey = newKey.replacingOccurrences(of: " ", with: "")

        var data = base64_decode(newKey)
        data = stripPrivateKeyHeader(data)
        if data == nil {
            return nil
        }

        return addPrivateKey(data!)
    }

    private static func addPrivateKey(_ data: Data) -> SecKey? {
        let tag = "RSAUtil_PrivKey"
        let dTag = tag.data(using: String.Encoding.utf8)

        var privateKey = Dictionary<CFString, Any>.init()
        privateKey[kSecClass] = kSecClassKey
        privateKey[kSecAttrKeyType] = kSecAttrKeyTypeRSA
        privateKey[kSecAttrApplicationTag] = dTag
        SecItemDelete(privateKey as CFDictionary)

        privateKey[kSecValueData] = data
        privateKey[kSecAttrKeyClass] = kSecAttrKeyClassPrivate
        privateKey[kSecReturnPersistentRef] = true

        var persistKey: CFTypeRef?
        var status = SecItemAdd(privateKey as CFDictionary, &persistKey)

        guard status == errSecSuccess || status == errSecDuplicateItem else {
            return nil
        }

        privateKey.removeValue(forKey: kSecValueData)
        privateKey.removeValue(forKey: kSecReturnPersistentRef)
        privateKey[kSecReturnRef] = true
        privateKey[kSecAttrKeyType] = kSecAttrKeyTypeRSA

        var keyRef: CFTypeRef?
        status = SecItemCopyMatching(privateKey as CFDictionary, &keyRef)
        guard status == errSecSuccess else {
            return nil
        }
        return (keyRef as! SecKey)
    }

    private static func encrypt(_ data: Data, with secKey: SecKey, and isSign: Bool) -> Data? {
        var srcbuf = dataToBytes(data)
        let srclen = data.count

        let blockSize = SecKeyGetBlockSize(secKey) * MemoryLayout<UInt8>.size
        var outbuf = [UInt8](repeating: 0, count: blockSize)
        let srcBlockSize = blockSize - 11

        var ret: Data? = Data()
        var index = 0
        while index < srclen {
            var dataLen = srclen - index
            if dataLen > srcBlockSize {
                dataLen = srcBlockSize
            }

            var outlen = blockSize
            var status = noErr

            let ptr = withUnsafePointer(to: &srcbuf[index]) { $0 }
            if isSign {
                status = SecKeyRawSign(secKey, SecPadding.PKCS1, ptr, dataLen, &outbuf, &outlen)
            } else {
                status = SecKeyEncrypt(secKey, SecPadding.PKCS1, ptr, dataLen, &outbuf, &outlen)
            }
            if status != 0 {
                ret = nil
                break
            } else {
                ret!.append(contentsOf: outbuf[0 ..< outlen])
            }

            index += srcBlockSize
        }

        return ret
    }

    private static func decrypt(_ data: Data, with secKey: SecKey) -> Data? {
        var srcbuf = dataToBytes(data)
        let srclen = data.count

        let blockSize = SecKeyGetBlockSize(secKey) * MemoryLayout<UInt8>.size
        var outbuf = [UInt8](repeating: 0, count: blockSize)
        let srcBlockSize = blockSize

        var ret: Data? = Data()
        var index = 0
        while index < srclen {
            var dataLen = srclen - index
            if dataLen > srcBlockSize {
                dataLen = srcBlockSize
            }

            var outlen = blockSize
            var status = noErr

            let ptr = withUnsafePointer(to: &srcbuf[index]) { $0 }
            status = SecKeyDecrypt(secKey, SecPadding(rawValue: 0), ptr, dataLen, &outbuf, &outlen)

            if status != 0 {
                ret = nil
                break
            } else {
                var idxFirstZero = -1
                var idxNextZero = Int(outlen)
                for index in 0 ..< outlen {
                    if outbuf[index] == 0 {
                        if idxFirstZero < 0 {
                            idxFirstZero = index
                        } else {
                            idxNextZero = index
                            break
                        }
                    }
                }
                ret?.append(contentsOf: outbuf[idxFirstZero + 1 ..< idxNextZero])
            }

            index += srcBlockSize
        }

        return ret
    }

    /// 从.der证书获取公钥
    /// - Parameter der: .der证书路径
    /// - Returns: 公钥
    private static func loadPublicKey(_ path: String) -> SecKey? {
        let data: Data
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            return nil
        }

        guard let cert = SecCertificateCreateWithData(nil, data as CFData) else {
            return nil
        }
        let key: SecKey?
        var trust: SecTrust?
        var error: CFError?
        let policy = SecPolicyCreateBasicX509()
        if SecTrustCreateWithCertificates(cert, policy, &trust) == noErr {
//            var result = SecTrustResultType.invalid
            if trust != nil {
                _ = SecTrustEvaluateWithError(trust!, &error)
//                if SecTrustEvaluate(trust!, &result) == noErr {
                if error == nil {
                    key = SecTrustCopyPublicKey(trust!)
                    return key
                }
            }
        }
        return nil
    }

    /// 从.p12证书获取私钥
    /// - Parameters:
    ///   - path: .p12证书路径
    ///   - password: ,p12证书密码
    /// - Returns: 私钥
    private static func loadPrivateKey(_ path: String, with password: String = "") -> SecKey? {
        let data: Data
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            return nil
        }

        var key: SecKey?
        let options = NSMutableDictionary()
        options[kSecImportExportPassphrase as String] = password
        var items: CFArray?
        var securityError = SecPKCS12Import(data as CFData, options, &items)
        if securityError == noErr && CFArrayGetCount(items) > 0 {
            let identityDict = CFArrayGetValueAtIndex(items, 0)
            let appKey = Unmanaged.passUnretained(kSecImportItemIdentity).toOpaque()
            let identityApp = CFDictionaryGetValue(identityDict as! CFDictionary, appKey)
            securityError = SecIdentityCopyPrivateKey(identityApp as! SecIdentity, &key)
            if securityError == noErr {
                return key
            }
        }
        return nil
    }

    /// Data转Byte(UInt8)数组
    /// - Parameter data: Data
    /// - Returns: Byte(UInt8)数组
    private static func dataToBytes(_ data: Data) -> [UInt8] {
        let string = dataToHex(data)
        var start = string.startIndex
        return stride(from: 0, to: string.count, by: 2).compactMap { _ in
            let end = string.index(after: start)
            defer { start = string.index(after: end) }
            return UInt8(string[start ... end], radix: 16)
        }
    }

    /// Data转16进制字符串
    /// - Parameter data: Data
    /// - Returns: 16进制字符串
    private static func dataToHex(_ data: Data) -> String {
        let bytes = [UInt8](data)
        var hex = ""
        for index in 0 ..< data.count {
            let newHex = String(format: "%x", bytes[index] & 0xFF)
            if newHex.count == 1 {
                hex = String(format: "%@0%@", hex, newHex)
            } else {
                hex += newHex
            }
        }
        return hex
    }

    // MARK: base64编码

    static func base64Eecrypt(ecrypt: String) -> String {
        if let data = ecrypt.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return ""
    }
}
