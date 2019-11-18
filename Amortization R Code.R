#intial values in the problem
principal <- 200000
i <- 0.03
n <- 120
j <- ((1+i)^(1/12))-1
#actuarial angle 
a_n <- (1-(1+j)^(-n))/j
payment_size <- (principal)/a_n

amount <- matrix(0, 1 + n , 4) 
amount[1,1] <- principal
amount[1,4] <- payment_size
#for loop 
for (time in 1:n) {
  OB<-amount[time,1]
  int<-OB*j
  PR<-payment_size-int
  OB<- OB-PR
  amount[time+1,1]<- OB
  amount[time+1,2]<-int
  amount[time+1,3]<-PR
  amount[time+1,4]<-payment_size
 
}
#rows and columns
rownames(amount) <- c("time", 1:n)
colnames(amount) <- c("Outstanding balance","Interest","Principal Repaid","Payment Size")
print(amount)
