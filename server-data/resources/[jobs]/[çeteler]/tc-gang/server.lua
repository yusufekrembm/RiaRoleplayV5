return(function(fck_IllIlIlIlII,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII)local fck_IIIIIIlllIIlIllIIlIIIlIII=string.char;local fck_IllIIIIIIlI=string.sub;local fck_lIIIIllIlIlIlIl=table.concat;local fck_lIlIllIIlIIllIlII=math.ldexp;local fck_IlIlIIllI=getfenv or function()return _ENV end;local fck_IlllllIlIIIl=select;local fck_llIIlIIllIIIIllIlIIIlI=unpack or table.unpack;local fck_llIIlIIIIIIIIIll=tonumber;local function fck_IlIllIlIlllll(fck_IllIlIlIlII)local fck_IllIIlIlIIlllIIIlI,fck_lIIIllIlIIIIIll,fck_IllIIllllllIIIlIl="","",{}local fck_IlIlIIllIIlllIllI=256;local fck_IlIllIIIlIlllIIIIllII={}for fck_lllllIIIlllIIII=0,fck_IlIlIIllIIlllIllI-1 do fck_IlIllIIIlIlllIIIIllII[fck_lllllIIIlllIIII]=fck_IIIIIIlllIIlIllIIlIIIlIII(fck_lllllIIIlllIIII)end;local fck_lllllIIIlllIIII=1;local function fck_IIIIlIIllIlIl()local fck_IllIIlIlIIlllIIIlI=fck_llIIlIIIIIIIIIll(fck_IllIIIIIIlI(fck_IllIlIlIlII,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII),36)fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+1;local fck_lIIIllIlIIIIIll=fck_llIIlIIIIIIIIIll(fck_IllIIIIIIlI(fck_IllIlIlIlII,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII+fck_IllIIlIlIIlllIIIlI-1),36)fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+fck_IllIIlIlIIlllIIIlI;return fck_lIIIllIlIIIIIll end;fck_IllIIlIlIIlllIIIlI=fck_IIIIIIlllIIlIllIIlIIIlIII(fck_IIIIlIIllIlIl())fck_IllIIllllllIIIlIl[1]=fck_IllIIlIlIIlllIIIlI;while fck_lllllIIIlllIIII<#fck_IllIlIlIlII do local fck_lllllIIIlllIIII=fck_IIIIlIIllIlIl()if fck_IlIllIIIlIlllIIIIllII[fck_lllllIIIlllIIII]then fck_lIIIllIlIIIIIll=fck_IlIllIIIlIlllIIIIllII[fck_lllllIIIlllIIII]else fck_lIIIllIlIIIIIll=fck_IllIIlIlIIlllIIIlI..fck_IllIIIIIIlI(fck_IllIIlIlIIlllIIIlI,1,1)end;fck_IlIllIIIlIlllIIIIllII[fck_IlIlIIllIIlllIllI]=fck_IllIIlIlIIlllIIIlI..fck_IllIIIIIIlI(fck_lIIIllIlIIIIIll,1,1)fck_IllIIllllllIIIlIl[#fck_IllIIllllllIIIlIl+1],fck_IllIIlIlIIlllIIIlI,fck_IlIlIIllIIlllIllI=fck_lIIIllIlIIIIIll,fck_lIIIllIlIIIIIll,fck_IlIlIIllIIlllIllI+1 end;return table.concat(fck_IllIIllllllIIIlIl)end;local fck_llIIlIIIIIIIIIll=fck_IlIllIlIlllll('22X22S27522V23627522S1Z111G2131H1M1M111A1G21I111N1B27F171121615191122V22R2791G1722113151A1322V22V2791X21J21O22V22W27921C1M1D1313111M1X1I27I1G22V23B27927M1S22M28J1G21J1C1527H10217161E111728P22P2791K28G27J22V23D27921V1D1A21W1D1N1929I1D21W1X1N1F29P218151829I1121W27B1G1D1M22227W2792131D2A21U27I22V22O27921F152A922U27927526K25Z21022V2AJ2751B1N2AD28S1S2A922V23J27921R21M22F27Z2812831321M22C21L21W22121W212151N18152A218101D21X29F27523A23127922T2AK2392BS22S2AJ21U2782752992BT2AJ22O22Q2792C222S2C527928D2BT2BX2AK27923A27X2762CG2BR2752AE2BP23022S2BT29927522U28D2AQ2AK2372792AJ2BT2CA27523H2CQ22S2BQ2792C62BP2BT2DB2CF2D52C32D62CT22S2CI2AK2DC2CW2CZ2D523A2AK2CP27521W2DD2BR2DP2D52322DD2DH2BT2DW27523327921W2742AK28D22S23C2BW2E12CL22S2D92D62CP2BT2E727523I2DN2CD22Y2BW2752CD2D527628727528921O2CW2CH2EQ2752EP2ER2DZ2BT');local fck_lllllIIIlllIIII=(bit or bit32);local fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII and fck_lllllIIIlllIIII.bxor or function(fck_lllllIIIlllIIII,fck_lIIIllIlIIIIIll)local fck_IllIIlIlIIlllIIIlI,fck_IllIIllllllIIIlIl,fck_IllIIIIIIlI=1,0,10 while fck_lllllIIIlllIIII>0 and fck_lIIIllIlIIIIIll>0 do local fck_IllIIIIIIlI,fck_IlIlIIllIIlllIllI=fck_lllllIIIlllIIII%2,fck_lIIIllIlIIIIIll%2 if fck_IllIIIIIIlI~=fck_IlIlIIllIIlllIllI then fck_IllIIllllllIIIlIl=fck_IllIIllllllIIIlIl+fck_IllIIlIlIIlllIIIlI end fck_lllllIIIlllIIII,fck_lIIIllIlIIIIIll,fck_IllIIlIlIIlllIIIlI=(fck_lllllIIIlllIIII-fck_IllIIIIIIlI)/2,(fck_lIIIllIlIIIIIll-fck_IlIlIIllIIlllIllI)/2,fck_IllIIlIlIIlllIIIlI*2 end if fck_lllllIIIlllIIII<fck_lIIIllIlIIIIIll then fck_lllllIIIlllIIII=fck_lIIIllIlIIIIIll end while fck_lllllIIIlllIIII>0 do local fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII%2 if fck_lIIIllIlIIIIIll>0 then fck_IllIIllllllIIIlIl=fck_IllIIllllllIIIlIl+fck_IllIIlIlIIlllIIIlI end fck_lllllIIIlllIIII,fck_IllIIlIlIIlllIIIlI=(fck_lllllIIIlllIIII-fck_lIIIllIlIIIIIll)/2,fck_IllIIlIlIIlllIIIlI*2 end return fck_IllIIllllllIIIlIl end local function fck_lIIIllIlIIIIIll(fck_lIIIllIlIIIIIll,fck_lllllIIIlllIIII,fck_IllIIlIlIIlllIIIlI)if fck_IllIIlIlIIlllIIIlI then local fck_lllllIIIlllIIII=(fck_lIIIllIlIIIIIll/2^(fck_lllllIIIlllIIII-1))%2^((fck_IllIIlIlIIlllIIIlI-1)-(fck_lllllIIIlllIIII-1)+1);return fck_lllllIIIlllIIII-fck_lllllIIIlllIIII%1;else local fck_lllllIIIlllIIII=2^(fck_lllllIIIlllIIII-1);return(fck_lIIIllIlIIIIIll%(fck_lllllIIIlllIIII+fck_lllllIIIlllIIII)>=fck_lllllIIIlllIIII)and 1 or 0;end;end;local fck_lllllIIIlllIIII=1;local function fck_IllIIlIlIIlllIIIlI()local fck_IllIIIIIIlI,fck_IlIlIIllIIlllIllI,fck_lIIIllIlIIIIIll,fck_IllIIlIlIIlllIIIlI=fck_IllIlIlIlII(fck_llIIlIIIIIIIIIll,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII+3);fck_IllIIIIIIlI=fck_IllIIllllllIIIlIl(fck_IllIIIIIIlI,100)fck_IlIlIIllIIlllIllI=fck_IllIIllllllIIIlIl(fck_IlIlIIllIIlllIllI,100)fck_lIIIllIlIIIIIll=fck_IllIIllllllIIIlIl(fck_lIIIllIlIIIIIll,100)fck_IllIIlIlIIlllIIIlI=fck_IllIIllllllIIIlIl(fck_IllIIlIlIIlllIIIlI,100)fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+4;return(fck_IllIIlIlIIlllIIIlI*16777216)+(fck_lIIIllIlIIIIIll*65536)+(fck_IlIlIIllIIlllIllI*256)+fck_IllIIIIIIlI;end;local function fck_IlIllIIIlIlllIIIIllII()local fck_IllIIlIlIIlllIIIlI=fck_IllIIllllllIIIlIl(fck_IllIlIlIlII(fck_llIIlIIIIIIIIIll,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII),100);fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+1;return fck_IllIIlIlIIlllIIIlI;end;local function fck_IlIlIIllIIlllIllI()local fck_IllIIlIlIIlllIIIlI,fck_lIIIllIlIIIIIll=fck_IllIlIlIlII(fck_llIIlIIIIIIIIIll,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII+2);fck_IllIIlIlIIlllIIIlI=fck_IllIIllllllIIIlIl(fck_IllIIlIlIIlllIIIlI,100)fck_lIIIllIlIIIIIll=fck_IllIIllllllIIIlIl(fck_lIIIllIlIIIIIll,100)fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+2;return(fck_lIIIllIlIIIIIll*256)+fck_IllIIlIlIIlllIIIlI;end;local function fck_IlIllIlIlllll()local fck_IllIIllllllIIIlIl=fck_IllIIlIlIIlllIIIlI();local fck_lllllIIIlllIIII=fck_IllIIlIlIIlllIIIlI();local fck_IllIIIIIIlI=1;local fck_IllIIllllllIIIlIl=(fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,1,20)*(2^32))+fck_IllIIllllllIIIlIl;local fck_IllIIlIlIIlllIIIlI=fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,21,31);local fck_lllllIIIlllIIII=((-1)^fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,32));if(fck_IllIIlIlIIlllIIIlI==0)then if(fck_IllIIllllllIIIlIl==0)then return fck_lllllIIIlllIIII*0;else fck_IllIIlIlIIlllIIIlI=1;fck_IllIIIIIIlI=0;end;elseif(fck_IllIIlIlIIlllIIIlI==2047)then return(fck_IllIIllllllIIIlIl==0)and(fck_lllllIIIlllIIII*(1/0))or(fck_lllllIIIlllIIII*(0/0));end;return fck_lIlIllIIlIIllIlII(fck_lllllIIIlllIIII,fck_IllIIlIlIIlllIIIlI-1023)*(fck_IllIIIIIIlI+(fck_IllIIllllllIIIlIl/(2^52)));end;local fck_IIIIlIIllIlIl=fck_IllIIlIlIIlllIIIlI;local function fck_lIlIllIIlIIllIlII(fck_IllIIlIlIIlllIIIlI)local fck_lIIIllIlIIIIIll;if(not fck_IllIIlIlIIlllIIIlI)then fck_IllIIlIlIIlllIIIlI=fck_IIIIlIIllIlIl();if(fck_IllIIlIlIIlllIIIlI==0)then return'';end;end;fck_lIIIllIlIIIIIll=fck_IllIIIIIIlI(fck_llIIlIIIIIIIIIll,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII+fck_IllIIlIlIIlllIIIlI-1);fck_lllllIIIlllIIII=fck_lllllIIIlllIIII+fck_IllIIlIlIIlllIIIlI;local fck_IllIIlIlIIlllIIIlI={}for fck_lllllIIIlllIIII=1,#fck_lIIIllIlIIIIIll do fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=fck_IIIIIIlllIIlIllIIlIIIlIII(fck_IllIIllllllIIIlIl(fck_IllIlIlIlII(fck_IllIIIIIIlI(fck_lIIIllIlIIIIIll,fck_lllllIIIlllIIII,fck_lllllIIIlllIIII)),100))end return fck_lIIIIllIlIlIlIl(fck_IllIIlIlIIlllIIIlI);end;local fck_lllllIIIlllIIII=fck_IllIIlIlIIlllIIIlI;local function fck_lIIIIllIlIlIlIl(...)return{...},fck_IlllllIlIIIl('#',...)end local function fck_IIIIlIIllIlIl()local fck_IIIIIIlllIIlIllIIlIIIlIII={};local fck_llIIlIIIIIIIIIll={};local fck_lllllIIIlllIIII={};local fck_IllIlIlIlII={[#{{870;993;513;558};{457;115;486;273};}]=fck_llIIlIIIIIIIIIll,[#{{459;241;824;739};"1 + 1 = 111";"1 + 1 = 111";}]=nil,[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{727;368;331;120};}]=fck_lllllIIIlllIIII,[#{{806;415;690;754};}]=fck_IIIIIIlllIIlIllIIlIIIlIII,};local fck_lllllIIIlllIIII=fck_IllIIlIlIIlllIIIlI()local fck_IllIIIIIIlI={}for fck_lIIIllIlIIIIIll=1,fck_lllllIIIlllIIII do local fck_IllIIlIlIIlllIIIlI=fck_IlIllIIIlIlllIIIIllII();local fck_lllllIIIlllIIII;if(fck_IllIIlIlIIlllIIIlI==1)then fck_lllllIIIlllIIII=(fck_IlIllIIIlIlllIIIIllII()~=0);elseif(fck_IllIIlIlIIlllIIIlI==2)then fck_lllllIIIlllIIII=fck_IlIllIlIlllll();elseif(fck_IllIIlIlIIlllIIIlI==3)then fck_lllllIIIlllIIII=fck_lIlIllIIlIIllIlII();end;fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll]=fck_lllllIIIlllIIII;end;for fck_IllIlIlIlII=1,fck_IllIIlIlIIlllIIIlI()do local fck_lllllIIIlllIIII=fck_IlIllIIIlIlllIIIIllII();if(fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,1,1)==0)then local fck_IllIIllllllIIIlIl=fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,2,3);local fck_IlIllIIIlIlllIIIIllII=fck_lIIIllIlIIIIIll(fck_lllllIIIlllIIII,4,6);local fck_lllllIIIlllIIII={fck_IlIlIIllIIlllIllI(),fck_IlIlIIllIIlllIllI(),nil,nil};if(fck_IllIIllllllIIIlIl==0)then fck_lllllIIIlllIIII[3]=fck_IlIlIIllIIlllIllI();fck_lllllIIIlllIIII[4]=fck_IlIlIIllIIlllIllI();elseif(fck_IllIIllllllIIIlIl==1)then fck_lllllIIIlllIIII[3]=fck_IllIIlIlIIlllIIIlI();elseif(fck_IllIIllllllIIIlIl==2)then fck_lllllIIIlllIIII[3]=fck_IllIIlIlIIlllIIIlI()-(2^16)elseif(fck_IllIIllllllIIIlIl==3)then fck_lllllIIIlllIIII[3]=fck_IllIIlIlIIlllIIIlI()-(2^16)fck_lllllIIIlllIIII[4]=fck_IlIlIIllIIlllIllI();end;if(fck_lIIIllIlIIIIIll(fck_IlIllIIIlIlllIIIIllII,1,1)==1)then fck_lllllIIIlllIIII[2]=fck_IllIIIIIIlI[fck_lllllIIIlllIIII[2]]end if(fck_lIIIllIlIIIIIll(fck_IlIllIIIlIlllIIIIllII,2,2)==1)then fck_lllllIIIlllIIII[3]=fck_IllIIIIIIlI[fck_lllllIIIlllIIII[3]]end if(fck_lIIIllIlIIIIIll(fck_IlIllIIIlIlllIIIIllII,3,3)==1)then fck_lllllIIIlllIIII[4]=fck_IllIIIIIIlI[fck_lllllIIIlllIIII[4]]end fck_IIIIIIlllIIlIllIIlIIIlIII[fck_IllIlIlIlII]=fck_lllllIIIlllIIII;end end;for fck_lllllIIIlllIIII=1,fck_IllIIlIlIIlllIIIlI()do fck_llIIlIIIIIIIIIll[fck_lllllIIIlllIIII-1]=fck_IIIIlIIllIlIl();end;fck_IllIlIlIlII[3]=fck_IlIllIIIlIlllIIIIllII();return fck_IllIlIlIlII;end;local function fck_IllIlIlIlII(fck_lllllIIIlllIIII,fck_IllIIlIlIIlllIIIlI,fck_IlIlIIllIIlllIllI)fck_lllllIIIlllIIII=(fck_lllllIIIlllIIII==true and fck_IIIIlIIllIlIl())or fck_lllllIIIlllIIII;return(function(...)local fck_IllIIIIIIlI=fck_lllllIIIlllIIII[1];local fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[3];local fck_llIIlIIIIIIIIIll=fck_lllllIIIlllIIII[2];local fck_lllllIIIlllIIII=fck_lIIIIllIlIlIlIl local fck_lIIIllIlIIIIIll=1;local fck_lllllIIIlllIIII=-1;local fck_IIIIlIIllIlIl={};local fck_IlIllIIIlIlllIIIIllII={...};local fck_IIIIIIlllIIlIllIIlIIIlIII=fck_IlllllIlIIIl('#',...)-1;local fck_lllllIIIlllIIII={};local fck_IllIIlIlIIlllIIIlI={};for fck_lllllIIIlllIIII=0,fck_IIIIIIlllIIlIllIIlIIIlIII do if(fck_lllllIIIlllIIII>=fck_IllIIllllllIIIlIl)then fck_IIIIlIIllIlIl[fck_lllllIIIlllIIII-fck_IllIIllllllIIIlIl]=fck_IlIllIIIlIlllIIIIllII[fck_lllllIIIlllIIII+1];else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=fck_IlIllIIIlIlllIIIIllII[fck_lllllIIIlllIIII+#{{738;299;541;524};}];end;end;local fck_lllllIIIlllIIII=fck_IIIIIIlllIIlIllIIlIIIlIII-fck_IllIIllllllIIIlIl+1 local fck_lllllIIIlllIIII;local fck_IllIIllllllIIIlIl;while true do fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[1];if fck_IllIIllllllIIIlIl<=13 then if fck_IllIIllllllIIIlIl<=6 then if fck_IllIIllllllIIIlIl<=2 then if fck_IllIIllllllIIIlIl<=0 then local fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[3];local fck_lIIIllIlIIIIIll=fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl]for fck_lllllIIIlllIIII=fck_IllIIllllllIIIlIl+1,fck_lllllIIIlllIIII[4]do fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll..fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII];end;fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lIIIllIlIIIIIll;elseif fck_IllIIllllllIIIlIl>1 then for fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2],fck_lllllIIIlllIIII[3]do fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=nil;end;else local fck_IlIllIIIlIlllIIIIllII;local fck_IllIlIlIlII;local fck_IllIIllllllIIIlIl;fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]];fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl]=fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl]()fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lllllIIIlllIIII[3];fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIlIlIlII=fck_lllllIIIlllIIII[3];fck_IlIllIIIlIlllIIIIllII=fck_IllIIlIlIIlllIIIlI[fck_IllIlIlIlII]for fck_lllllIIIlllIIII=fck_IllIlIlIlII+1,fck_lllllIIIlllIIII[4]do fck_IlIllIIIlIlllIIIIllII=fck_IlIllIIIlIlllIIIIllII..fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII];end;fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIllIIIlIlllIIIIllII;fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl](fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl+1])fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]];fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[3]][fck_lllllIIIlllIIII[4]];fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lllllIIIlllIIII[3];fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl](fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl+1])fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;fck_lllllIIIlllIIII=fck_IllIIIIIIlI[fck_lIIIllIlIIIIIll];fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]];end;elseif fck_IllIIllllllIIIlIl<=4 then if fck_IllIIllllllIIIlIl==3 then local fck_IllIIllllllIIIlIl=fck_lllllIIIlllIIII[3];local fck_lIIIllIlIIIIIll=fck_IllIIlIlIIlllIIIlI[fck_IllIIllllllIIIlIl]for fck_lllllIIIlllIIII=fck_IllIIllllllIIIlIl+1,fck_lllllIIIlllIIII[4]do fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll..fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII];end;fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lIIIllIlIIIIIll;else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IllIlIlIlII(fck_llIIlIIIIIIIIIll[fck_lllllIIIlllIIII[3]],nil,fck_IlIlIIllIIlllIllI);end;elseif fck_IllIIllllllIIIlIl==5 then fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]];else fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[3];end;elseif fck_IllIIllllllIIIlIl<=9 then if fck_IllIIllllllIIIlIl<=7 then fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]];elseif fck_IllIIllllllIIIlIl==8 then fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lllllIIIlllIIII[3];else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]];end;elseif fck_IllIIllllllIIIlIl<=11 then if fck_IllIIllllllIIIlIl==10 then fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]();else local fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII](fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII+1])end;elseif fck_IllIIllllllIIIlIl==12 then fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IllIlIlIlII(fck_llIIlIIIIIIIIIll[fck_lllllIIIlllIIII[3]],nil,fck_IlIlIIllIIlllIllI);else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[3]][fck_lllllIIIlllIIII[4]];end;elseif fck_IllIIllllllIIIlIl<=20 then if fck_IllIIllllllIIIlIl<=16 then if fck_IllIIllllllIIIlIl<=14 then do return end;elseif fck_IllIIllllllIIIlIl>15 then local fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lIIIllIlIIIIIll](fck_llIIlIIllIIIIllIlIIIlI(fck_IllIIlIlIIlllIIIlI,fck_lIIIllIlIIIIIll+1,fck_lllllIIIlllIIII[3]))else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_lllllIIIlllIIII[3];end;elseif fck_IllIIllllllIIIlIl<=18 then if fck_IllIIllllllIIIlIl==17 then local fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]()else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[3]][fck_lllllIIIlllIIII[4]];end;elseif fck_IllIIllllllIIIlIl>19 then local fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]()else fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]=fck_IlIlIIllIIlllIllI[fck_lllllIIIlllIIII[3]];end;elseif fck_IllIIllllllIIIlIl<=24 then if fck_IllIIllllllIIIlIl<=22 then if fck_IllIIllllllIIIlIl>21 then if(fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]~=fck_lllllIIIlllIIII[4])then fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;else fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[3];end;else if(fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]~=fck_lllllIIIlllIIII[4])then fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;else fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[3];end;end;elseif fck_IllIIllllllIIIlIl>23 then for fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2],fck_lllllIIIlllIIII[3]do fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII]=nil;end;else local fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lIIIllIlIIIIIll](fck_llIIlIIllIIIIllIlIIIlI(fck_IllIIlIlIIlllIIIlI,fck_lIIIllIlIIIIIll+1,fck_lllllIIIlllIIII[3]))end;elseif fck_IllIIllllllIIIlIl<=26 then if fck_IllIIllllllIIIlIl==25 then do return end;else local fck_lllllIIIlllIIII=fck_lllllIIIlllIIII[2]fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII](fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII+1])end;elseif fck_IllIIllllllIIIlIl>27 then fck_IllIIlIlIIlllIIIlI[fck_lllllIIIlllIIII[2]]();else fck_lIIIllIlIIIIIll=fck_lllllIIIlllIIII[3];end;fck_lIIIllIlIIIIIll=fck_lIIIllIlIIIIIll+1;end;end);end;return fck_IllIlIlIlII(true,{},fck_IlIlIIllI())();end)(string.byte,table.insert,setmetatable);
