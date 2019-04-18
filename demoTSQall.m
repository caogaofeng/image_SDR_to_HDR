%startup
% ����������ɫ�ռ��£�����������������+�����ع����򽵹⡱˫�ع����µĽ����������allColor�ļ����¡�
% allColor�ļ����У�P����Q��������ͼƬ�����֣�������ͼ�����ֺ�����:ͼƬ��_��ɫ�ռ�_����.��׺��
% ���в�������Dark(���ع����򽵹�)  Light(������������)    Light_Dark(����������������+�����ع����򽵹⡱)
addpath ours;
addpath colorspace;

cs = {'YCbCr','JPEG-YCbCr','YDbDr','YPbPr','YUV','YIQ','HSV','HSL','HSI','Lab','Luv','LCH',};% 'XYZ','CAT02 LMS','RGB'
idx= {  1,        1,          1,     1,     1,    1,     3,    3,    3,    1,    1,    1,  };%   0   ,    0   ,    0

file = 'allColor\Q';%�޸�����ͼƬ��·��
I = imread( [file,'.jpg'] ); %�޸�����ͼƬ�ĺ�׺

%RGB�ռ�
name = 'RGB';
J = im2double(I);
fprintf('\n   0 name = RGB\n');
V2 = TooDark(J,0.5,0.38);%ԭͼ���նȱ仯���ع��ʣ��ع�����Ϊ�������ȣ�Խ��Խ����
J = V2;
imwrite(J, [file,'_',name,'_Dark.jpg'] );
%����RGB�е�RGB����
[K,W] = TooLight(I,0.5);
imwrite(K, [file,'_',name,'_Light.jpg'] );
J = J.*W+K.*(1-W);
imwrite(J, [file,'_',name,'_Light_Dark.jpg'] );
fprintf('\n');
subplot 121; imshow(I); title('ԭʼͼ');
subplot 122; imshow(J); title('�����'); 


for ii = 1:numel(cs)
    %����������ɫ�ռ� �� ���ȷ��� �䰵
    J = im2double(I);
    name = cs{ii};
    ch = idx{ii};
    fprintf('\n   %d name = %s\n',ii, name);
    
    hsvJ = colorspace(['RGB->',name],J);
    %hsvJ = rgb2hsv(J);
    V = hsvJ(:,:,ch);
    V2 = TooDark(V,0.5);%ԭͼ���նȱ仯���ع��ʣ�Ϊ������ͼƬ�ؼ��㣩
    hsvJ(:,:,ch) = real(V2);
    J = colorspace([name,'->RGB'],hsvJ);
    %J = hsv2rgb(hsvJ);
    imwrite(J, [file,'_',name,'_Dark.jpg'] );

    %����RGB�е�RGB����%����ע��
    %K = TooLight(I,0.5);
    %imwrite(K, [file,'_out_Light.jpg'] );
    %J = (J+K)/2.0;

    %����RGB�е�RGB����
    [K,W] = TooLight(I,0.5);
    imwrite(K, [file,'_',name,'_Light.jpg'] );

    J = J.*W+K.*(1-W);
    %subplot 321; imshow(J); title('J');
    %subplot 322; imshow(K); title('K');
    %subplot 323; imshow(W); title('W');
    %subplot 324; imshow(J.*W); title('J.*W');
    %subplot 325; imshow(1-W); title('1-W'); 
    %subplot 326; imshow(K.*(1-W)); title('K.*(1-W)');
    imwrite(J, [file,'_',name,'_Light_Dark.jpg'] );
    fprintf('\n');
end


