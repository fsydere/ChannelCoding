function [DecodedM] = Hamming_7_4_Decoder(CodedM)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    len = length(CodedM);
    H = [1 1 1 0 1 0 0;
         1 0 1 1 0 1 0;
         1 1 0 1 0 0 1];
    DecodedM = zeros(1,(len-(len/7)*3)) == 0;
    lastptr = 1;
    for iter = 1:7:len
        syndrome = (mod(CodedM(iter:iter+6)*H',2) == 1);
        if(num2str(syndrome) == "0 1 1")
            disp("n-OK, m3 WRONG")
            DecodedM(lastptr:lastptr+3) = CodedM(iter:iter+3);
            DecodedM(lastptr+2) = ~DecodedM(lastptr+2);
        elseif(num2str(syndrome) == "1 0 1")
            disp("n-OK, m2 WRONG")
            DecodedM(lastptr:lastptr+3) = CodedM(iter:iter+3);
            DecodedM(lastptr+1) = ~DecodedM(lastptr+1);
        elseif(num2str(syndrome) == "1 1 0")
            disp("n-OK, m4 WRONG")
            DecodedM(lastptr:lastptr+3) = CodedM(iter:iter+3);
            DecodedM(lastptr+3) = ~DecodedM(lastptr+3);
        elseif(num2str(syndrome) == "1 1 1")
            disp("n-OK, m1 WRONG")
            DecodedM(lastptr:lastptr+3) = CodedM(iter:iter+3);
            DecodedM(lastptr) = ~DecodedM(lastptr);
        else
            DecodedM(lastptr:lastptr+3) = CodedM(iter:iter+3);
        end
    
        lastptr  = lastptr+4;
    end
end