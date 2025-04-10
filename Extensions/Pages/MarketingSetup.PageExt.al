// PageExtension 52193562 pageextension52193562 extends "Marketing Setup" 
// {
//     layout
//     {
//         modify("Exchange Service URL")
//         {
//             Visible = false;
//         }
//         modify("Exchange Account User Name")
//         {
//             Visible = false;
//         }
//         modify(ExchangeAccountPasswordTemp)
//         {
//             Visible = false;
//         }
//     }
//     actions
//     {

//     }

//     //Unsupported feature: Code Modification on "OnOpenPage".

//     //trigger OnOpenPage()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         RESET;
//         IF NOT GET THEN BEGIN
//           INIT;
//           INSERT;
//         END;

//         AttachmentStorageLocationEnabl := "Attachment Storage Type" = "Attachment Storage Type"::"Disk File";
//         GlobalSynchronizationIsEnabled := IntegrationManagement.IsIntegrationServicesEnabled;
//         ExchangeAccountPasswordTemp := '';
//         IF ("Exchange Account User Name" <> '') AND (NOT ISNULLGUID("Exchange Account Password Key")) THEN
//           ExchangeAccountPasswordTemp := '**********';
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..8
//         */
//     //end;


//     //Unsupported feature: Code Modification on "InitExchangeService(PROCEDURE 2)".

//     //procedure InitExchangeService();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF "Autodiscovery E-Mail Address" = '' THEN
//           ERROR(Text006);

//         IF "Exchange Account User Name" <> '' THEN BEGIN
//           CreateExchangeAccountCredentials(Credentials);
//           Result :=
//             ExchangeWebServicesClient.InitializeOnServer("Autodiscovery E-Mail Address","Exchange Service URL",Credentials);
//         END ELSE
//           Result := ExchangeWebServicesClient.InitializeOnClient("Autodiscovery E-Mail Address","Exchange Service URL");

//         IF NOT Result THEN
//           ERROR(Text007);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         IF "Autodiscovery E-Mail Address" = '' THEN
//           ERROR(Text006);
//         Result := ExchangeWebServicesClient.Initialize("Autodiscovery E-Mail Address");
//         IF NOT Result THEN
//           ERROR(Text007);
//         */
//     //end;

//     //Unsupported feature: Property Deletion (Local) on "GetExchangeFolder(PROCEDURE 4)".


//     //Unsupported feature: Property Deletion (Local) on "ValidateEmailLoggingSetup(PROCEDURE 6)".



//     //Unsupported feature: Code Modification on "ValidateEmailLoggingSetup(PROCEDURE 6)".

//     //procedure ValidateEmailLoggingSetup();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         ExchangeWebServicesClient.InvalidateService;

//         ValidationCaption := FIELDCAPTION("Autodiscovery E-Mail Address");
//         ProgressWindow.OPEN(Text013,ValidationCaption);

//         IF "Exchange Account User Name" <> '' THEN BEGIN
//           CreateExchangeAccountCredentials(Credentials);
//           CanInitialize := ExchangeWebServicesClient.InitializeOnServer("Autodiscovery E-Mail Address",
//               "Exchange Service URL",Credentials);
//         END ELSE
//           CanInitialize := ExchangeWebServicesClient.InitializeOnClient("Autodiscovery E-Mail Address","Exchange Service URL");

//         IF NOT CanInitialize THEN BEGIN
//           ErrorMsg := Text006;
//           EXIT(FALSE);
//         END;
//         #17..39
//         MarketingSetup.MODIFY;

//         EXIT(TRUE);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..5
//         IF NOT ExchangeWebServicesClient.Initialize(MarketingSetup."Autodiscovery E-Mail Address") THEN BEGIN
//         #14..42
//         */
//     //end;

//     //Unsupported feature: Deletion (VariableCollection) on "InitExchangeService(PROCEDURE 2).Credentials(Variable 1001)".


//     //Unsupported feature: Deletion (VariableCollection) on "ValidateEmailLoggingSetup(PROCEDURE 6).Credentials(Variable 1006)".


//     //Unsupported feature: Deletion (VariableCollection) on "ValidateEmailLoggingSetup(PROCEDURE 6).CanInitialize(Variable 1003)".

// }

