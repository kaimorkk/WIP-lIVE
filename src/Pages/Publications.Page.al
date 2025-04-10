Page 52193809 Publications
{
    PageType = Card;
    SourceTable = Publication1;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(DateOfsubmission; "Date Of submission")
                {
                    ApplicationArea = Basic;
                }
                field(Attachment; Attachment)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Document)
            {
                Caption = 'Documents';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Code, "Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Code, "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Code;
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Code, "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Code;
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Code, "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Code;
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Code, "Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Code, "Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Send)
            {
                ApplicationArea = Basic;
                Caption = 'Send';

                trigger OnAction()
                begin
                    if Status <> Status::open then
                        Error('You have already been send by the user!!')
                    else begin

                        // //Mail.NewIncidentMail(compinfo."Communication & PA",Description,Text1+' '+Code);
                        Status := Status::Sent;
                        Modify;

                        Message('Publication submitted')

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Send_Promoted; Send)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Status := Status::open;
    end;

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        Text1: label 'Please find Publication submision No.';
}

