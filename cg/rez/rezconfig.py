import glob
import os

packages_path = ['~/packages',
                             '${LCA_REZ}/packages/applications',
                             '${LCA_REZ}/packages/third_party',
                             '${LCA_REZ}/packages/inhouse',
                             '${LCA_REZ}/packages/projects',
                             '${LC_UTILITY}/linked_tools/lca_rez_packages']

#add lca_* package root
lca_packages=glob.glob(
                os.getenv('LCA_REZ','/mnt/utility/linked_tools/lca_rez')+
                '/packages/lca_*')
packages_path.extend(lca_packages)
# We don`t need this print!
# print 'Add rez packages_path :',packages_path