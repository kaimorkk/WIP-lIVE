

page 80163 "Strategic Int Planning Lines"
{
    PageType = List;
    SourceTable = "Strategic Int Planning Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Annual Reporting Codes"; Rec."Annual Reporting Codes")
                {
                    ApplicationArea = Basic;
                }
                field("Target Budget"; Rec."Target Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                // field("Weight%"; Rec."Weight%")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Allocate Bugdet")
            {
                ApplicationArea = Basic;
                Caption = 'Allocate Bugdet';
                Image = Allocate;
                // RunObject = Report "Allocate Budget";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Allocate Bugdet_Promoted"; "Allocate Bugdet")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

