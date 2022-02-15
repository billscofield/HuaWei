
nLog()

init('0',0)     竖屏


mSleep()        毫秒


touchDown(0,x,y)

touchMove(0,x,y)

touchUp(0,x,y)


function click(x,y)
    touchDown(0,x,y)
    mSleep(20)
    touchMove(0,x,y)
    mSleep(20)
    touchUp(0,x,y)
end


while true
do
    click(10,10)
    mSleep(1000)
done





