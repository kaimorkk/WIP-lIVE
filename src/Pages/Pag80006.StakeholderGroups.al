

page 80006 "Stakeholder Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Group";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Sub-Groups"; Rec."No. of Sub-Groups")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Go To List")
            {
                ApplicationArea = Basic;
                Image = Navigate;

                trigger OnAction()
                begin
                    RunReportOrPageLink;
                end;
            }
            action("Sub-Groups")
            {
                ApplicationArea = Basic;
                Image = Route;
                RunObject = Page "Stakeholder Sub-Groups";
                RunPageLink = "Stakeholder Group" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Go To List_Promoted"; "Go To List")
                {
                }
                actionref("Sub-Groups_Promoted"; "Sub-Groups")
                {
                }
            }
        }
    }

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        if (Rec."Object Type" = 0) or (Rec."Object ID" = 0) then
            exit;
        if Rec."Object Type" = AllObjWithCaption."object type"::Page then
            Page.Run(Rec."Object ID")
        else
            Report.Run(Rec."Object ID");
    end;
}

#pragma implicitwith restore

