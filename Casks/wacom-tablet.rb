cask 'wacom-tablet' do
  version '6.3.31-6'
  sha256 'ebd90458e6fc414bab8506623ebad2f3d093a29bcfd3b0a8c96b18704282085d'

  url "https://cdn.wacom.com/u/productsupport/drivers/mac/professional/WacomTablet_#{version}.dmg"
  name 'Wacom Intuos 4/5/Pro Tablet'
  homepage 'https://www.wacom.com/support/product-support/drivers'

  conflicts_with cask: 'wacom-intuos-3-tablet'

  pkg 'Install Wacom Tablet.pkg'

  uninstall launchctl: [
                         'com.wacom.wacomtablet',
                         'com.wacom.UpdateHelper',
                         'com.wacom.displayhelper',
                         'com.wacom.DataStoreMgr',
                         'com.wacom.DisplayMgr',
                       ],
            quit:      [
                         'com.wacom.TabletDriver',
                         'com.wacom.WacomTabletDriver',
                         'com.wacom.WacomTouchDriver',
                       ],
            kext:      [
                         'com.wacom.kext.ftdi',
                         'com.wacom.kext.wacomtablet',
                         'com.silabs.driver.CP210xVCPDriver',
                         'com.silabs.driver.CP210xVCPDriver64',
                       ],
            pkgutil:   'com.wacom.TabletInstaller',
            delete:    '/Applications/Wacom Tablet.localized'

  zap trash: [
               '~/Library/Preferences/com.wacom.wacomtablet.plist',
               '~/Library/Preferences/com.wacom.wacomtablet.prefs',
               '~/Library/Preferences/com.wacom.wacomtouch.prefs',
               '~/Library/Preferences/com.wacom.RemoveWacomTablet.plist',
               '~/Library/Preferences/com.wacom.Wacom-Desktop-Center.plist',
             ]
end
