package model;

import java.util.Comparator;

public class OrderComparator implements Comparator<Question>
{
    @Override
    public int compare(Question x, Question y)
    {
        // Assume neither string is null. Real code should
        // probably be more robust
        // You could also just return x.length() - y.length(),
        // which would be more efficient.
        if (Integer.parseInt(x.getType_ques_n()) < Integer.parseInt(y.getType_ques_n()))
        {
            return -1;
        }
        else if (Integer.parseInt(x.getType_ques_n()) > Integer.parseInt(y.getType_ques_n()))
        {
            return 1;
        }
        return 0;
    }
}