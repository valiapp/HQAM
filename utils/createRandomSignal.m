% Simulates a modulated signal to be sent to the receiver
%   @param size: number of symbols in the signal
%   @param method: the method of modulation(currently supporting QAM, rHQAM)
%   @param M: order of constellation
%   @param dmin: minimum distance between two consecutive symbols
% Returns a 1xsize array
function signal = createRandomSignal(size, method, M, dmin)
    signal = zeros(1, size);
    if method == "QAM"
        x = QAM(M, dmin);
    elseif method == "rHQAM"
        x = rHQAM(M, dmin);
    elseif method == "irHQAM"
        x = irHQAM(M, dmin);
    else
        error('Wrong method as input')
    end
    for i = 1:size
        idx = randperm(M,1);
        signal(i) = x(idx);
    end
