page 51033 "Training History1"
{
    //R ApplicationArea = All;
    Caption = 'Training History';
    PageType = ListPart;
    SourceTable = "Training History";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Training; Rec.Training)
                {
                    ApplicationArea = All;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Funding; Rec.Funding)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
