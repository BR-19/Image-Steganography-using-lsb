function[O]=decode_msg(img,pass);         
input=img;             
height=size(input,1);          
width=size(input,2);         
length_msg=double(input(size(input,1),size(input,2),1))*8;   
bit=input(size(input,1),size(input,2),2);
if(pass~=bit) 

     O='*********';
    return 
end
count=1;      

for i = 1 : height
    for j = 1 : width
         if (count<=length_msg)
          store(count)=mod(double(input(i,j,bit)),2);
          count=count+1;
         end
    end
end

 bin_arr=store;      
 bin=[128 64 32 16 8 4 2 1];      
 bin_arr = bin_arr(:);
  
    bin_matrix =reshape(bin_arr,8,[]);
    hidden_text=char(bin*bin_matrix);    
O=hidden_text;
end