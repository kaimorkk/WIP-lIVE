page 52193737 "PR Third Party Charges"
{

    Caption = 'PR Third Party Charges';
    PageType = List;
    SourceTable = "PR Third Party Charges";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Charge Per Transaction"; "Charge Per Transaction")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
