page 52193631 "PR Transaction Code Groups"
{

    Caption = 'PR Transaction Code Groups';
    PageType = List;
    SourceTable = "PR Trans Codes Groups";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = All;
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
