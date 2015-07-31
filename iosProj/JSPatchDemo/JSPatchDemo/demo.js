var countNum = 0;

defineClass('JPViewController', {
  btnPressed: function(sender) {
    if (countNum % 7 == 0) {
        self.view().setBackgroundColor(require('UIColor').redColor());
    } else if (countNum % 7 == 1) {
        self.view().setBackgroundColor(require('UIColor').orangeColor());
    } else if (countNum % 7 == 2) {
        self.view().setBackgroundColor(require('UIColor').yellowColor());
    } else if (countNum % 7 == 3) {
        self.view().setBackgroundColor(require('UIColor').greenColor());
    } else if (countNum % 7 == 4) {
        self.view().setBackgroundColor(require('UIColor').cyanColor());
    } else if (countNum % 7 == 5) {
        self.view().setBackgroundColor(require('UIColor').blueColor());
    } else if (countNum % 7 == 6) {
        self.view().setBackgroundColor(require('UIColor').purpleColor());
    }
    countNum++;
    if (countNum == 7) countNum = 0;
  }
})
