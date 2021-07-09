N_bits=2;
secretmax=2^(N_bits);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minuVect= [50 75 -2.35619449019235;130 95 2.35619449019235;88 101 2.61799387799149;78 157 -2.35619449019235;189 172 -2.61799387799149;253 204 -2.35619449019235;118 217 2.61799387799149;116 229 -2.61799387799149;135 249 2.61799387799149;232 16 -0.523598775598299;193 25 -0.523598775598299;87 43 3.14159265358979;229 44 -0.523598775598299;64 64 -2.61799387799149;254 72 2.09439510239320;258 77 -1.57079632679490;138 83 0;230 86 2.35619449019235;40 116 0.785398163397448;206 126 -0.785398163397448;138 147 -1.04719755119660;137 163 2.09439510239320;227 173 -1.57079632679490;205 174 -2.09439510239320;162 176 -2.35619449019235;106 185 -1.57079632679490;243 187 -2.09439510239320;118 198 2.61799387799149;102 202 -1.04719755119660;163 211 -2.09439510239320];
deg_neg=rad2deg(minuVect(:,3));
neg_val=deg_neg(find(deg_neg(:)<0)); neg_val=neg_val+360;
deg_neg(find(deg_neg(:)<0))=neg_val;

MV_x=minuVect(:,1);
MV_y=minuVect(:,2);
MV_theta=floor(deg_neg);
M_template_1=[MV_x MV_y MV_theta];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


M_template_2=M_template_1;
M_template_1_prime=zeros(size(M_template_1,1),size(M_template_1,2));
M_template_2_prime=zeros(size(M_template_2,1),size(M_template_2,2));


secret_size=N_bits*numel(M_template_1);
Secret=randi([0,secretmax-1],size(M_template_1,1),size(M_template_1,2));

for i=1:size(M_template_1,1)
    
    for j=1:size(M_template_1,2)
        M1_elements_used=M_template_1(i,j);
        M2_elements_used=M_template_2(i,j);
        [x_prime,y_prime] = DE_encode(M1_elements_used,M2_elements_used,Secret(i,j));
        M_template_1_prime(i,j)=x_prime;
        M_template_2_prime(i,j)=y_prime;
        
    end

end



secret_reconstructed=zeros(size(M_template_1_prime,1),size(M_template_1_prime,2));
M_template_regenerate=zeros(size(M_template_1_prime,1),size(M_template_1_prime,2));
for i=1:size(M_template_1_prime,1)
    
    for j=1:size(M_template_1_prime,2)
        M1_elements_used=M_template_1_prime(i,j);
        M2_elements_used=M_template_2_prime(i,j);
        [x_original,y_original,b_decoded] = DE_decode(M1_elements_used,M2_elements_used);
        secret_reconstructed(i,j)=b_decoded;
        M_template_regenerate(i,j)=x_original;
        
    end

end






