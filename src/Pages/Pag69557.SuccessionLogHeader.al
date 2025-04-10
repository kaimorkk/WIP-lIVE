

page 69557 "Succession Log Header"
{
    CardPageID = "Succession Log Card";
    Editable = false;
    PageType = List;
    SourceTable = "Succession Log Header";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Succession Program"; Rec."Succession Program")
                {
                    ApplicationArea = Basic;
                }
                field(Mentee; Rec.Mentee)
                {
                    ApplicationArea = Basic;
                }
                field("Mentee Name"; Rec."Mentee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Mentor; Rec.Mentor)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

