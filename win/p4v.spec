# -*- mode: python -*-

a = Analysis(['p4v.py'],
             pathex=['../pyinstaller-2.0'],
             hiddenimports=["p4vasp"],
             hookspath=['.'])
pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name=os.path.join('dist', 'p4v.exe'),
          debug=False,
          strip=None,
          upx=True,
          icon="p4.ico",
          console=False )
