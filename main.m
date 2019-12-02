function[output]=main()

console_inp=input('Welcome to IMAGE STEGANOGRAPHY PROJECT \nEnter 1 to Encode, 2 for Decode:\n');

if console_inp==1
    [file_name,path]=uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select "Image" to Hide Message.');
    img=imread(strcat(path,file_name));
    
    msg=input('Enter Secret Message: ','s');
    bit= input('Enter which colur channel to choose  \nEnter 1 for Red, 2 for Green,3 for Blue:\n');
    output=encode_msg(img,msg,bit);
    
    imwrite(output,'stegno.bmp');
  
elseif(console_inp==2) 
    
    [file_name,path]=uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select "Image" to Hide Message.');
    img=imread(strcat(path,file_name));
    pass=input('Enter Secret Password');
    output=decode_msg(img,pass);
    
    disp(output);
end