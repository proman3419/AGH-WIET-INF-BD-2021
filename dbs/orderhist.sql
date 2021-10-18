

USE northwind



CREATE TABLE orderhist
  (productid INT NOT NULL,
   orderid INT NOT NULL,
   quantity INT NOT NULL)

GO

INSERT orderhist VALUES(1,1,5)
INSERT orderhist VALUES(1,2,10)
INSERT orderhist VALUES(2,1,10)
INSERT orderhist VALUES(2,2,25)
INSERT orderhist VALUES(3,1,15)
INSERT orderhist VALUES(3,2,30)
