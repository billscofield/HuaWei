Lua中没有内置的Sleep函数,有4种方法可以实现Sleep函数功能,如下:

1. 方法1

在一个死循环中设置一个跳出条件,但是这样的做法会占用大量CPU资源,强烈不推荐使用.

    function Sleep(n)
        local t0 = os.clock()
        while os.clock() - t0 <= n do end
    end

2. 方法2

    调用系统的Sleep函数,不消耗CPU,但是Windows系统中没有内置这个命令(或者使用Cygwin),推荐在Linux系统中使用该方法.

    function Sleep(n)
        os.execute("sleep " .. n)
    end

3. 方法3

    虽然Windows没有内置Sleep命令,但是利用ping命令的性质.

    function Sleep(n)
        if n > 0 then os.execute("ping -n " .. tonumber(n + 1) .. " localhost > NUL") end
    end

4. 方法4

    使用socket库中select函数,可以传递0.1给n,使得休眠的时间精度达到毫秒级别.

    require("socket")
    function Sleep(n)
        socket.select(nil, nil, n)
    end
