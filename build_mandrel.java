//usr/bin/env jbang "$0" "$@" ; exit $?
//JAVA 14
//JAVAC_OPTIONS --enable-preview -source 14
//JAVA_OPTIONS --enable-preview
//DEPS org.mendrugo.qollider:qollider:999-SNAPSHOT

import org.mendrugo.qollider.Jdk;
import org.mendrugo.qollider.Mandrel;
import org.mendrugo.qollider.Qollider;
import org.mendrugo.qollider.Repositories;
import org.mendrugo.qollider.Repository;

public class build_mandrel
{
    public static void main(String... args)
    {
        final var qollider = Qollider.of();
        qollider
            .plan(
                qollider.jdk().build(
                    new Jdk.Build(Repositories.JDK_11_DEV)
                )
                , qollider.mandrel().build(
                    new Mandrel.Build(
                        Repository.github("galderz", "mandrel", "t_better_reflect")
                        , Repositories.MX
                        , Repositories.MANDREL_PACKAGING
                    )
                )
            )
            .run();
    }
}
