
## Alpine
Alpine Linux is a security-oriented, lightweight Linux distribution based on **musl libc** and **busybox**.


## BusyBox
BusyBox ��һ�����������ٶ�����Linux����͹��ߵ������BusyBox ������һЩ�򵥵Ĺ��ߣ�����ls��cat��echo�ȵȣ���������һЩ���󡢸����ӵĹ��ߣ���grep��find��mount�Լ�telnet����Щ�˽� BusyBox ��Ϊ Linux ���������ʿ�������򵥵�˵BusyBox�ͺ����Ǹ��󹤾��䣬������ѹ���� Linux ����๤�ߺ����Ҳ������ Android ϵͳ���Դ���shell��

## Libc
libc��������Դ����ʷ��ָC�������ĺ����⣬����ͷ�ļ��ͻ���C��libc.a�������libc�ɷ���C������Щ��д�ģ���������C��ֲ����ͬƽ̨��libcҲ���˶���汾��������Ϊ�˼��ݰɣ��ܶ�ͷ�ļ���libc.a���ļ�����û�б䣨�ܺõĴ�ͳ����

����libc��ָC�����⣬���õ���㣬������ǿ�ĵ�Ȼ��GNU LibC�����glibc�������а�Linux�õľ���glibc��

libc�Ķ�̬��汾������libc.so��ͨ����/usr/lib/libc.so��glibc��libc.so��ʵ����.so�ļ�������һ��ld Script����û�й�ϵ��gnu ld ����ȷ����ġ�

���������汾��libc������newlibc��ͨ������Ƕ��ϵͳ�С�

### musl libc
Welcome to the home of musl, a new standard library to power a new generation of Linux-based devices. musl is lightweight, fast, simple, free, and strives to be correct in the sense of standards-conformance and safety.


1. Glibc = GNU C Library ��GNU�GNU Project��Ŀ����ʵ�ֵ� C���Ա�׼�⣨C standard library���� Ŀǰ������������ͷ������е�GNU/Linux���ϵͳ�У������õ�����C���Ա�׼�⡣ ��ʵ���˳�����C��ĺ�����֧�ֺܶ���ϵͳƽ̨�����ܺ�ȫ������Ҳ��ԱȽ�ӷ�׺��Ӵ�

2. uClibc һ��С�͵�C���Ա�׼�⣬��Ҫ����Ƕ��ʽ�� ���ʼ�������uClinux��ע��uClinux��֧��MMU������˱Ƚ�������΢�������С� ��Ӧ�ģ��˴���u��˼�Ǧ̣�Micro��΢С����˼�� 
    1. uClibc���ص㣺 
        1. uClibc��glibcҪС�ܶࡣ (2)uClibc�Ƕ����ģ�Ϊ��Ӧ����Ƕ��ʽϵͳ�У���ȫ����ʵ�ֳ����ġ���glibc��Դ��ṹ�Ͷ������ϣ��������ݡ�

3. EGLIBC = Embedded GLIBC EGLIBC�ǣ���������glibc��ԭ������֯FSF�����£��Ƴ��ģ�glibc��һ�ֱ��壬Ŀ�����ڽ�glibc����Ƕ��ʽϵͳ�� 
    EGLIBC��Ŀ���ǣ� 
    1. ����Դ��Ͷ����Ƽ���ļ�����Glibc Դ����ܹ���ABI������� �������ʵ�������Ŀ�꣬����ζ�ţ���֮ǰ��glibc����ĳ��򣬿���ֱ����eglibc�滻��������Ҫ���±��롣 �����Ϳ��Ը���֮ǰ�ĺܶ�ĳ����ˡ� 
    1. ����(�ڴ�)��Դռ��/���� 
    1. ʹ�����ģ��Ϊ�����õģ���ʵ�ְ���ü�����Ҫ��ģ�飩 
    1. ��߶��ڽ������(cross-compilation)�ͽ������(cross-testing)��֧�� Eglibc������Ҫ�ص���ǿ����ã���������Ƕ��ʽϵͳ�У���������Ҫ��ģ�飬����NIS��locale�ȣ��Ϳ��Բü�������������뵽���У�ʹ�ý������ɵĿ�Ĵ�С�ˡ� �����ص㣬����ȥ����Eglibc���ص� ��glibc, uClibc, Elibc��ԨԴ/��ʷ/����/��ϵ�� 
    
    1. д������Ҫ�õ��ܶ�c���ԵĿ⺯�������еĿ⺯�������������Ƕ�Ӧ��C���ԣ���׼�������⡣ 
    2. Ŀǰ����ͨGNU/Linuxϵͳ�����õ�C���Ա�׼�⣬����glibc���书�ܺ�ȫ�������ܶ࣬���Ǵ���̫�࣬��������ĺ�����Ĵ�СҲ�ܴ󣬼���Դռ��Ҳ�ܶࡣ 
    3. ��Ƕ��ʽϵͳ�У�Ҳ��ҪC����д����ʵ���ض����ܣ�Ҳ��Ҫ�õ�C���Ժ����⣬��������Ƕ��ʽϵͳ�У�һ����Դ�Ƚ����ޣ����Բ��ʺ�ֱ��ʹ�ã�̫ռ����Դ�ģ�gLibc�� 
    4. �������˾��֣�û�вο�glibc�����Ǵ�ͷ��ʼ��������ʵ����һ������Ƕ��ʽϵͳ�еģ����������Ǻܴ�ģ���Դռ����Խ��ٵģ�C���Ժ����⣬����uClibc�����ң�uClibc��֧��MMU���ڴ����Ԫ���� 
    5. ��������glibc�Ŀ����ߣ����Ƴ���Embedded glibc�����eglibc������ҪĿ��Ҳ�ǽ�glibc����Ƕ��ʽ���� ��Ӧ���ĸĶ������ڣ��Ѹ���Ŀ⺯������Ϊ�����õģ�������������Ƕ��ʽϵͳ�в���ҪĳЩ�������Ϳ��Բü��������Ѹú������뵽���eglibc���У�ʹ���������ɵ�eglibc��Ĵ�С��С�����շ������Ƕ��ʽϵͳ��Ҫ�󣨲��ܳ���һ���Ĵ�С������������ʵ���ˣ���glibc������Ƕ��ʽϵͳ�е�Ŀ���ˡ� 
    
    1. ���Լ򵥵����Ϊ�� glibc��uClibc��eglibc����C���Ժ����⣺ 
        1. uClibc��Ƕ��ʽϵͳ���õģ�glibc������ϵͳ�õ� 
        2. eglibcҲ��Ƕ��ʽϵͳ���õģ���glibc��Ƕ��ʽ�汾����glibc��Դ��Ͷ������ϼ��ݡ�

4. Musl-libc C���Ա�׼��Musl-libc��Ŀ������1.0�档Musl��һ����������C��׼�⣬�����ΪGNU C library (glibc)�� uClibc��Android Bionic���������Ƕ��ʽ����ϵͳ���ƶ��豸������ѭPOSIX 2008���� C99 ��׼������MIT���֤��Ȩ��ʹ��Musl��Linux���а����Ŀ����sabotage��bootstrap-linux��LightCube OS�ȵȡ�

Ŀǰopenwrt LEDEĬ��ʹ��Musl-libc�ˡ�����CC��֧����uclibc
