import androidx.compose.foundation.gestures.Orientation
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.expense_monitor.CurrentPlatform
import app.jdgn.expense_monitor.currentPlatform
import app.jdgn.expense_monitor.src.components.CustomListItem
import app.jdgn.expense_monitor.src.components.CustomListSubTitle
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.arrows_up_down
import walletmonitor.composeapp.generated.resources.bank
import walletmonitor.composeapp.generated.resources.calendar
import walletmonitor.composeapp.generated.resources.card
import walletmonitor.composeapp.generated.resources.face_id
import walletmonitor.composeapp.generated.resources.fingerprint
import walletmonitor.composeapp.generated.resources.info
import walletmonitor.composeapp.generated.resources.message
import walletmonitor.composeapp.generated.resources.password
import walletmonitor.composeapp.generated.resources.person
import walletmonitor.composeapp.generated.resources.piggy
import walletmonitor.composeapp.generated.resources.settings

object More {
    @Composable
    fun Content(navController: NavHostController = rememberNavController()) {
        val scrollState = rememberScrollState()

        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(scrollState),
            verticalArrangement = Arrangement.Top,
            horizontalAlignment = Alignment.Start
        ) {
            CustomListSubTitle("Movements")
            CustomListItem(
                icon = Res.drawable.calendar,
                title = "Calendar",
            )
            CustomListItem(
                icon = Res.drawable.piggy,
                title = "Goal",
            )
            CustomListItem(
                icon = Res.drawable.arrows_up_down,
                title = "Expenses and Income",
            )
            CustomListSubTitle("Accounts")
            CustomListItem(
                icon = Res.drawable.bank,
                title = "Accounts",
                onClick = { navController.navigate("accounts") }
            )
            CustomListItem(
                icon = Res.drawable.person,
                title = "Persons",
            )
            CustomListSubTitle("Security")
            CustomListItem(
                icon = Res.drawable.password,
                title = "Pin",
            )
            CustomListItem(
                icon =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        Res.drawable.fingerprint
                    else
                        Res.drawable.face_id,
                title =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        "Biometric"
                    else
                        "Face id",
            )
            CustomListSubTitle("More")
            CustomListItem(
                icon = Res.drawable.settings,
                title = "Settings",
            )
            CustomListItem(
                icon = Res.drawable.info,
                title = "Info",
            )
            CustomListItem(
                icon = Res.drawable.message,
                title = "Feedback",
            )
        }
    }
}