#intial values in the problem
Par_value <- 10000
Redemption <- 10000
Price <- coupon_size*a_n+Redemption*(1+j)^(-n)
i <- 0.04
n <- 20
r <- 0.06
j <- i/2
coupon_size <- Par_value*r
#actuarial angle 
a_n <- (1-(1+j)^(-n))/j
payment_size <- (principal)/a_n

amount <- matrix(0, 1 + n , 4) 
amount[1,1] <- Price
amount[1,4] <- coupon_size
#for loop 
for (time in 1:n) {
  OB<-amount[time,1]
  int<-OB*j
  PR<-coupon_size-int
  OB<- OB-PR 
  amount[time+1,1]<- OB
  amount[time+1,2]<-int
  amount[time+1,3]<-PR
  amount[time+1,4]<-coupon_size

  
}
#rows and columns
rownames(amount) <- c("time", 1:n)
colnames(amount) <- c("Book Value","Interest","Principal Repaid","Coupon Size")
print(amount)