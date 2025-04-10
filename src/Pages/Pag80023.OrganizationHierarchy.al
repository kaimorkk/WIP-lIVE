

page 80023 "Organization Hierarchy"
{
    PageType = ListPart;
    SourceTable = "Organization Hierarchy";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Structure Type"; Rec."Structure Type")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    trigger OnValidate()
                    begin
                        if Rec."Structure Type" = Rec."Structure Type"::Administrative then
                            VisibleFunction := false
                        else
                            if Rec."Structure Type" = Rec."Structure Type"::Functional then
                                VisibleFunction := true;
                    end;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                    trigger OnValidate()
                    begin
                        if Rec."Structure Type" = Rec."Structure Type"::Administrative then
                            VisibleFunction := false
                        else
                            if Rec."Structure Type" = Rec."Structure Type"::Functional then
                                VisibleFunction := true;
                    end;
                }
                // field(Description; Rec.Description)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Description field.';
                // }

                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    //Enabled = VisibleFunction;

                }
                field("Designation Description"; Rec."Designation Description")
                {

                    ApplicationArea = Basic;
                    Enabled = VisibleFunction;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Organization Units")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                //RunObject = Page "Organizational Units  List";
                //RunPageLink = "Hierarchical  Level ID" = field(Level) where("Structure Type"=Filter());
                ToolTip = 'Executes the Organization Units action.';
                trigger OnAction()
                begin
                    if Rec."Structure Type" = Rec."Structure Type"::Administrative then begin
                        RespC.Reset();
                        // RespC.SetRange(RespC."Court Level", Format(Rec."Entry No."));
                        if RespC.Find('-') then
                            Page.RunModal(Page::"Organizational Units  List", RespC);

                    end else
                        if Rec."Structure Type" = Rec."Structure Type"::Functional then begin
                            jobs.Reset();
                            jobs.SetRange(jobs."Position ID", Rec.Designation);
                            if jobs.find('-') then
                                Page.RunModal(Page::"Position Card", jobs);
                        end;
                end;
            }
        }
    }
    var
        RespC: Record "Responsibility Center";
        jobs: Record "Company Positions";
        VisibleFunction: Boolean;
}

#pragma implicitwith restore

