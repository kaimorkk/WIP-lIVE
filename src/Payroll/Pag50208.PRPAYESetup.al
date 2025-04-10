page 52193632 "PR PAYE Setup"
{

    Caption = 'PR PAYE Setup';
    PageType = List;
    SourceTable = "PR PAYE";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                    ApplicationArea = All;
                }
                field("PAYE Tier"; Rec."PAYE Tier")
                {
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                }
                field("Tax Code"; Rec."Tax Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
