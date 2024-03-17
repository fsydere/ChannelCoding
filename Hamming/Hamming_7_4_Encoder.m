function [CodedData] = Hamming_7_4_Encoder(input)
    %UNTITLED3 Summary of this function goes here
    %   (7,4) Hamming Decoder
    len = length(input);
    G = [1 0 0 0 1 1 1;
         0 1 0 0 1 0 1;
         0 0 1 0 1 1 0;
         0 0 0 1 0 1 1];
    
    CodedData = zeros(1,((len/4)*3)+len) == 0;
    
    lastptr = 1;
    
    for iter = 1:4:len
        CodedData(lastptr:lastptr+6) = (mod(input(iter:iter+3)*G,2) == 1);
        lastptr = lastptr+7;
    end
end