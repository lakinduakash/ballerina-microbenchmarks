
function seqMergesort(int[] array){
    int[] helper = [];
    doSeqMergesort(array, helper, 0, array.length() - 1);
}

function doSeqMergesort(int[] array, int[] helper, int low, int high){
    if (low < high) {
        int middle = (low + high) / 2;
        doSeqMergesort(array, helper, low, middle);
        doSeqMergesort(array, helper, middle + 1, high);
        _ = merge(array, helper, low, middle, high);
    } 
}

function merge(int[] array, int[] helper, int low, int middle, int high) {
    foreach var i in low ... high {
        helper[i] = array[i];
    }

    int helperLeft = low;
    int helperRight = middle + 1;
    int current = low;

    while (helperLeft <= middle && helperRight <= high) {
        if (helper[helperLeft] <= helper[helperRight]) {
            array[current] = helper[helperLeft];
            helperLeft = helperLeft + 1;
        } else {
            array[current] = helper[helperRight];
            helperRight = helperRight + 1;
        }
        current = current + 1;
    }

    while (helperLeft <= middle) {
        array[current] = helper[helperLeft];
        current = current + 1;
        helperLeft = helperLeft + 1;
    }
}