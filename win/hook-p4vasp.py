from glob import *
from os.path import join,split

p4vasppath="."

def p4vaspModules(p4vasppath):
  modules=[]
  for submodule in ["","applet","paint3d","piddle"]:
    for x in glob(join(p4vasppath,"lib","p4vasp",submodule,"*.py")):
      l=["p4vasp"]
      if len(submodule):
        l.append(submodule)
      l.append(split(x)[1].replace(".py",""))
      modules.append(".".join(l))
  return modules

hiddenimports=p4vaspModules(p4vasppath)
datas=[("./data/*","data")]