

page 69200 "HR Disciplinary Cases"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(EmpNames; EmpNames)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
            part("Case Details"; "HR Disciplinary Cases Listpart")
            {
                Caption = 'Case Details';
                SubPageLink = "Employee No" = field("No."), Status = filter(<> Open);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000002; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = '&Mark as Closed/Open';
                    ToolTip = 'Executes the &Mark as Closed/Open action.';
                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset;
                        HRDisciplinary.SetRange(HRDisciplinary.Selected, true);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", Rec."No.");
                        if HRDisciplinary.Find('-') then begin

                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then begin
                                Error('You cannot have more than one application selected');
                                // ERROR(FORMAT(Number)+' applications selected');

                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Submitted;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end;

                        end else begin
                            Error('No disciplinary case selected');
                        end;
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Attachments;
                    // RunObject = Page "Employee Discplinary Documents";
                    // RunPageLink = "Doc No." = field("No.");
                    ToolTip = 'Executes the Attachments action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category6)
            {
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        HREmp.Reset;
        if HREmp.Get(Rec."No.") then begin
            EmpNames := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else begin
            EmpNames := '';
        end;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}

#pragma implicitwith restore

