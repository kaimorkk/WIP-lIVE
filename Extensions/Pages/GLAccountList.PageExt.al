PageExtension 52193430 pageextension52193430 extends "G/L Account List" 
{
    layout
    {
        addafter("Account Type")
        {
            field("Global Dimension 1 Code";"Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
            }
            field("Global Dimension 2 Code";"Global Dimension 2 Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

