/////////////// Draw Canvas //////////////////////

const grid = document.getElementById('grid');
const ctx = grid.getContext("2d");

ctx.drawVLine = function(left, top, width){
    this.fillRect(left, top, 0.7, width)
}
ctx.drawHLine = function(left, top, width){
    this.fillRect(left, top, width, 0.7)
}
ctx.fillStyle = 'white'
for(var i=0; i <= 498; i = i+2){
    for (var j = 0; j <= 498; j = j+2) {
        ctx.drawHLine(0, j, 500)   
    }
    ctx.drawVLine(i, 0, 500)
}
ctx.fillStyle = 'black'

//////////////////////////////////////////////////

////////////// Display output graphics /////////////////

fetch('output.txt').then(r => r.text()).then(text => {
    drawCanvas(text)
})
function drawCanvas(text){

    lettersTotal = (text.length-100) / 25

    spaces = []
    loopPos = 0
    amount = 0
    i = 0
    while(loopPos < lettersTotal){
        for (var j = 0; j < 25; j++) {
            if(text[j + i] == '0'){
               amount += 1
            }
        }
        if(amount == 25){
            spaces.push(loopPos)
        }
        loopPos++
        i+=25 
        amount = 0
    }
    //console.log(spaces)

    k = 0
    posx = 2
    posy = 2
    offsetx = 0
    offsety = 0

    dx = 2  //largo del px
    dy = 2  //ancho del px

    loopPos = 0
    while(loopPos < lettersTotal){
        diff = 0
        for (let ind = 0; ind < spaces.length; ind++) {
            if(loopPos == spaces[ind]){
                diff = spaces[ind+1] - loopPos - 1
            }
        }
        
        for (var i = 0; i < 5; i++) {
            for (var j = 0; j < 5; j++) {
                if(text[k] == '1'){
                   ctx.fillRect(offsetx + posx*j, offsety + posy*i, dx , dy)
                }
                k++
            }
        }
        if(offsetx > 475 || ((offsetx + diff*25) > 525)){
            offsetx = 0
            offsety += 12
        }else{
            offsetx += 12
        }
        loopPos++
    }
    offsetx = 100
    offsety += 50
    loopPos = 0
    sig = text.slice(-100)
    //console.log(sig)
    while(loopPos < 100){
        diff = 0   
        for (var i = 0; i < 10; i++) {
            for (var j = 0; j < 10; j++) {
                if(text[k] == '1'){
                   ctx.fillRect(offsetx + posx*j, offsety + posy*i, dx , dy)
                }
                k++
            }
        }
        if(offsetx > 475 || ((offsetx + diff*25) > 525)){
            offsetx = 0
            offsety += 12
        }else{
            offsetx += 12
        }
        loopPos++
    }
}
