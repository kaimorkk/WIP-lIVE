PageExtension 52193585 pageextension52193585 extends "Fixed Asset G/L Journal" 
{
    layout
    {
        addafter("FA Reclassification Entry")
        {
            field("Posting Group";"Posting Group")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }
}

