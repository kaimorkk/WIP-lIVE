

page 56209 "Annual Appraisal"
{
    PageType = Card;
    SourceTable = "Annual Appraisal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Overall Quartely score"; Rec."Overall Quartely score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Quartely score field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Designation field.';
                }
                field("Terms of service"; Rec."Terms of service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terms of service field.';
                }
                field("Acting Appointment"; Rec."Acting Appointment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acting Appointment/Special Duty field.';
                }
                field("Additional Assignment"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ObjText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Additional Assignment");
                        Rec."Additional Assignment".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Additional Assignment");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Additional Assignment".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field(Remarks; ObjText2)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ObjText2 field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Remarks);
                        Rec.Remarks.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);

                        if ObjText2 <> Format(Obj2) then begin
                            Clear(Rec.Remarks);
                            Clear(Obj2);
                            Obj2.AddText(ObjText2);
                            Rec.Remarks.CreateOutstream(ObjOutStr2);
                            Obj2.Write(ObjOutStr2);
                            //MODIFY;
                        end;
                    end;
                }
                field("Supervisor Code"; Rec."Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Code field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Supervisor Designation"; Rec."Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Designation field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control22; "Annual Appraisal Lines")
            {
                SubPageLink = "Appraisal No" = field(No);
                ApplicationArea = Basic;
            }
            part(Control28; "Training & Development Needs")
            {
                SubPageLink = "Appraisal No" = field(No);
                ApplicationArea = Basic;
            }
            part("Mid-Year Review"; "Mid-Year Review")
            {
                SubPageLink = "Appraisal No" = field(No);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to the Supervisor")
            {
                ApplicationArea = Basic;
                Image = SendElectronicDocument;
                ToolTip = 'Executes the Send to the Supervisor action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"Sent to supervisior";
                    Rec.Modify;
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(56205, true, true, Rec)
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send to the Supervisor_Promoted"; "Send to the Supervisor")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
        }
    }

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Obj2: BigText;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        ObjText2: Text;
}

#pragma implicitwith restore

